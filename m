Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0312B4E3
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 14:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE0MU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 08:20:56 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37987 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726206AbfE0MUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 08:20:55 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VEcVhb3kOsDWyVEcXhZEK6; Mon, 27 May 2019 14:20:53 +0200
Subject: Re: [PATCH] qv4l2: Prevent high CPU usage on device disconnect
To:     Tasos Sahanidis <tasos@tasossah.com>, linux-media@vger.kernel.org
References: <19b10673-7c90-5bb7-c596-94f73414d65e@tasossah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <53f97d24-41e2-881f-ff48-963f0252d48a@xs4all.nl>
Date:   Mon, 27 May 2019 14:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <19b10673-7c90-5bb7-c596-94f73414d65e@tasossah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF03xDKlDDziHFtS3WEqkXQw/WmL6WhRlXSRbOuNiVfaIxWM6t2R8HDctlhdyq0yBIicVUAotDVPg7ftboZjuTgxySIMwiGzEOuOA2eEnxlCotAdKM6X
 d/Njz0pylKE22P9NwhofVhTPkAajg9AxNRUhGdg1xuDNecsN4fTfW2YjXMSvPcpZ3RWXjor/Fe7eAImMbZPGUHpG8gT8cjE+HFD0g/wvimICirbM8OJowzgW
 VLvFrz3YCGhcWcAi88ZiDWS3jlPrMxYtBduhs5/qZANJxhIRphVKHAatJ1JAX1vFWqZ+yWSEqJN1argiBgoe/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tasos,

On 5/9/19 3:32 PM, Tasos Sahanidis wrote:
> On device disconnect, ApplicationWindow::ctrlEvent() gets called
> continuously, causing high CPU usage.
> Closing the device handles once ENODEV is returned fixes this.

I'm missing your Signed-of-by. Can you reply to this and add your SoB so I
can merge this patch?

Regards,

	Hans

> ---
>  utils/qv4l2/alsa_stream.c |  2 +-
>  utils/qv4l2/qv4l2.cpp     | 24 +++++++++++++++++++-----
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/qv4l2/alsa_stream.c b/utils/qv4l2/alsa_stream.c
> index 05944822..2dca283b 100644
> --- a/utils/qv4l2/alsa_stream.c
> +++ b/utils/qv4l2/alsa_stream.c
> @@ -433,7 +433,7 @@ static snd_pcm_sframes_t readbuf(snd_pcm_t *handle, char *buf, long len)
>      snd_pcm_uframes_t frames;
>      snd_pcm_htimestamp(handle, &frames, &timestamp);
>      r = snd_pcm_readi(handle, buf, len);
> -    if (r < 0 && r != -EAGAIN) {
> +    if (r < 0 && !(r == -EAGAIN || r == -ENODEV)) {
>  	r = snd_pcm_recover(handle, r, 0);
>  	if (r < 0)
>  	    fprintf(error_fp, "alsa: overrun recover error: %s\n", snd_strerror(r));
> diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
> index b52a3b60..9ac2c332 100644
> --- a/utils/qv4l2/qv4l2.cpp
> +++ b/utils/qv4l2/qv4l2.cpp
> @@ -495,8 +495,9 @@ void ApplicationWindow::setAudioBufferSize()
>  void ApplicationWindow::ctrlEvent()
>  {
>  	v4l2_event ev;
> +	int event_ret = 0;
>  
> -	while (dqevent(ev) == 0) {
> +	while ((event_ret = dqevent(ev)) == 0) {
>  		if (ev.type == V4L2_EVENT_SOURCE_CHANGE) {
>  			m_genTab->sourceChange(ev);
>  			continue;
> @@ -551,6 +552,15 @@ void ApplicationWindow::ctrlEvent()
>  			setString(ev.id, c.string);
>  		free(c.string);
>  	}
> +
> +	if (event_ret && errno == ENODEV) {
> +		closeDevice();
> +		if (m_capture != NULL) {
> +			m_capture->stop();
> +			delete m_capture;
> +			m_capture = NULL;
> +		}
> +	}
>  }
>  
>  void ApplicationWindow::newCaptureWin()
> @@ -558,6 +568,7 @@ void ApplicationWindow::newCaptureWin()
>  	if (m_capture != NULL) {
>  		m_capture->stop();
>  		delete m_capture;
> +		m_capture = NULL;
>  	}
>  
>  	switch (m_renderMethod) {
> @@ -1135,7 +1146,7 @@ void ApplicationWindow::stopStreaming()
>  	if (!m_genTab->isSDR() && m_genTab->isRadio())
>  		return;
>  
> -	if (v4l_type_is_capture(g_type()))
> +	if (v4l_type_is_capture(g_type()) && m_capture != NULL)
>  		m_capture->stop();
>  
>  	m_snapshotAct->setDisabled(true);
> @@ -1561,8 +1572,10 @@ void ApplicationWindow::makeFullScreen(bool checked)
>  void ApplicationWindow::closeDevice()
>  {
>  	stopAudio();
> -	delete m_sigMapper;
> -	m_sigMapper = NULL;
> +	if(m_sigMapper != NULL) {
> +		m_sigMapper->deleteLater();
> +		m_sigMapper = NULL;
> +	}
>  	m_capStartAct->setEnabled(false);
>  	m_capStartAct->setChecked(false);
>  	m_capStepAct->setEnabled(false);
> @@ -1579,7 +1592,7 @@ void ApplicationWindow::closeDevice()
>  			m_outNotifier = NULL;
>  		}
>  		if (m_ctrlNotifier) {
> -			delete m_ctrlNotifier;
> +			m_ctrlNotifier->deleteLater();
>  			m_ctrlNotifier = NULL;
>  		}
>  		delete [] m_frameData;
> @@ -1740,6 +1753,7 @@ void ApplicationWindow::closeEvent(QCloseEvent *event)
>  {
>  	closeDevice();
>  	delete m_capture;
> +	m_capture = NULL;
>  	event->accept();
>  }
>  
> 


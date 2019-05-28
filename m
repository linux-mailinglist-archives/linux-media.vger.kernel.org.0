Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4BE2C508
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 13:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfE1LAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 07:00:51 -0400
Received: from devnull.tasossah.com ([107.6.175.157]:39260 "EHLO
        devnull.tasossah.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfE1LAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 07:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=devnull.tasossah.com; s=vps;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=+CdEaZ8lH5V+GUtozx5uMrMakF0hpON1hKDmr+2VWrw=;
        b=HupP3e30jEtP0WuvEzHgJ/6rZD095laK8ZsxAT4BCE5NHdCXpgkylwSYbidqTDiGdGzR27bh/bcDrDzO3VtI3tKEMR+6uk8lmZi3W1KUFl2qJxedYopcJbpnKECRsyDkFWvOnQODuBZnHx93g8uZHm/UsEmCSVqaWffNAOQIvwA=;
Received: from [2a02:587:6a0c:c600::298]
        by devnull.tasossah.com with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <tasos@tasossah.com>)
        id 1hVZqb-0000DT-5A; Tue, 28 May 2019 14:00:49 +0300
Subject: Re: [PATCH] qv4l2: Prevent high CPU usage on device disconnect
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <19b10673-7c90-5bb7-c596-94f73414d65e@tasossah.com>
 <53f97d24-41e2-881f-ff48-963f0252d48a@xs4all.nl>
From:   Tasos Sahanidis <tasos@tasossah.com>
Openpgp: preference=signencrypt
Autocrypt: addr=tasos@tasossah.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <04073372-2f2a-4f3e-1354-21d6fcfeda92@tasossah.com>
Date:   Tue, 28 May 2019 14:00:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <53f97d24-41e2-881f-ff48-963f0252d48a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>

On 2019-05-27 15:20, Hans Verkuil wrote:
> Hi Tasos,
> 
> On 5/9/19 3:32 PM, Tasos Sahanidis wrote:
>> On device disconnect, ApplicationWindow::ctrlEvent() gets called
>> continuously, causing high CPU usage.
>> Closing the device handles once ENODEV is returned fixes this.
> 
> I'm missing your Signed-of-by. Can you reply to this and add your SoB so I
> can merge this patch?
> 
> Regards,
> 
> 	Hans
> 
>> ---
>>  utils/qv4l2/alsa_stream.c |  2 +-
>>  utils/qv4l2/qv4l2.cpp     | 24 +++++++++++++++++++-----
>>  2 files changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/utils/qv4l2/alsa_stream.c b/utils/qv4l2/alsa_stream.c
>> index 05944822..2dca283b 100644
>> --- a/utils/qv4l2/alsa_stream.c
>> +++ b/utils/qv4l2/alsa_stream.c
>> @@ -433,7 +433,7 @@ static snd_pcm_sframes_t readbuf(snd_pcm_t *handle, char *buf, long len)
>>      snd_pcm_uframes_t frames;
>>      snd_pcm_htimestamp(handle, &frames, &timestamp);
>>      r = snd_pcm_readi(handle, buf, len);
>> -    if (r < 0 && r != -EAGAIN) {
>> +    if (r < 0 && !(r == -EAGAIN || r == -ENODEV)) {
>>  	r = snd_pcm_recover(handle, r, 0);
>>  	if (r < 0)
>>  	    fprintf(error_fp, "alsa: overrun recover error: %s\n", snd_strerror(r));
>> diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
>> index b52a3b60..9ac2c332 100644
>> --- a/utils/qv4l2/qv4l2.cpp
>> +++ b/utils/qv4l2/qv4l2.cpp
>> @@ -495,8 +495,9 @@ void ApplicationWindow::setAudioBufferSize()
>>  void ApplicationWindow::ctrlEvent()
>>  {
>>  	v4l2_event ev;
>> +	int event_ret = 0;
>>  
>> -	while (dqevent(ev) == 0) {
>> +	while ((event_ret = dqevent(ev)) == 0) {
>>  		if (ev.type == V4L2_EVENT_SOURCE_CHANGE) {
>>  			m_genTab->sourceChange(ev);
>>  			continue;
>> @@ -551,6 +552,15 @@ void ApplicationWindow::ctrlEvent()
>>  			setString(ev.id, c.string);
>>  		free(c.string);
>>  	}
>> +
>> +	if (event_ret && errno == ENODEV) {
>> +		closeDevice();
>> +		if (m_capture != NULL) {
>> +			m_capture->stop();
>> +			delete m_capture;
>> +			m_capture = NULL;
>> +		}
>> +	}
>>  }
>>  
>>  void ApplicationWindow::newCaptureWin()
>> @@ -558,6 +568,7 @@ void ApplicationWindow::newCaptureWin()
>>  	if (m_capture != NULL) {
>>  		m_capture->stop();
>>  		delete m_capture;
>> +		m_capture = NULL;
>>  	}
>>  
>>  	switch (m_renderMethod) {
>> @@ -1135,7 +1146,7 @@ void ApplicationWindow::stopStreaming()
>>  	if (!m_genTab->isSDR() && m_genTab->isRadio())
>>  		return;
>>  
>> -	if (v4l_type_is_capture(g_type()))
>> +	if (v4l_type_is_capture(g_type()) && m_capture != NULL)
>>  		m_capture->stop();
>>  
>>  	m_snapshotAct->setDisabled(true);
>> @@ -1561,8 +1572,10 @@ void ApplicationWindow::makeFullScreen(bool checked)
>>  void ApplicationWindow::closeDevice()
>>  {
>>  	stopAudio();
>> -	delete m_sigMapper;
>> -	m_sigMapper = NULL;
>> +	if(m_sigMapper != NULL) {
>> +		m_sigMapper->deleteLater();
>> +		m_sigMapper = NULL;
>> +	}
>>  	m_capStartAct->setEnabled(false);
>>  	m_capStartAct->setChecked(false);
>>  	m_capStepAct->setEnabled(false);
>> @@ -1579,7 +1592,7 @@ void ApplicationWindow::closeDevice()
>>  			m_outNotifier = NULL;
>>  		}
>>  		if (m_ctrlNotifier) {
>> -			delete m_ctrlNotifier;
>> +			m_ctrlNotifier->deleteLater();
>>  			m_ctrlNotifier = NULL;
>>  		}
>>  		delete [] m_frameData;
>> @@ -1740,6 +1753,7 @@ void ApplicationWindow::closeEvent(QCloseEvent *event)
>>  {
>>  	closeDevice();
>>  	delete m_capture;
>> +	m_capture = NULL;
>>  	event->accept();
>>  }
>>  
>>
> 

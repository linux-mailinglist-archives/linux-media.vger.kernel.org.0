Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD05EF6849
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfKJKF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:05:58 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38009 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726604AbfKJKF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:05:58 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Tk6TiN8VSQBsYTk6Wi1R0E; Sun, 10 Nov 2019 11:05:57 +0100
Subject: Re: [PATCH 0/2] media: ALSA memalloc cleanups
To:     Takashi Iwai <tiwai@suse.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191108163649.32590-1-tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3e227447-d243-44d8-baa5-8a715b812ab8@xs4all.nl>
Date:   Sun, 10 Nov 2019 11:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108163649.32590-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBZslb93LPxmaIqIMgy3oLzRgX98mPRt2glHMAepznh/+5CyOedcoNVn5rPeCPM/QbVMjGrRMqsItlhB8C+3Pqf4Zar90aHT2s/ZOYP7Lvn0ynmCmzQ3
 e4qhO0QiaQwMoGzHtb689gdA0IcYw1v7JpepolsVv9+1kZpPPMFN45WxwAd7/qY34c0taak1jWeQw8jBAIrxAeI8YF924gRT8mdJVH/hwF97BMh8QQDvPuus
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 5:36 PM, Takashi Iwai wrote:
> Hi,
> 
> this is a couple of cleanups for media subsystem wrt ALSA memory
> allocation API usages.  It's based on the recent API changes that are
> found in for-next of my sound git tree for 5.5 kernel, hence these
> patches need to be applied on top of it.
> 
> So, just give me ACK if they are OK, so that I can apply them.

I Acked them. Mauro is very busy so you'll have to do with my Ack,
and anyway I maintain those drivers.

Regards,

	Hans

> 
> 
> thanks,
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (2):
>   media: solo6x10: Remove superfluous snd_dma_continuous_data()
>   media: tw686x: audio: Avoid non-standard macro usage
> 
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
>  drivers/media/pci/tw686x/tw686x-audio.c    | 2 +-
>  drivers/media/usb/usbtv/usbtv-audio.c      | 3 +--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 


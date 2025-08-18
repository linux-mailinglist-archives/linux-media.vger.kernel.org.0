Return-Path: <linux-media+bounces-40138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45E5B2A098
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91525168EE3
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBAC31B120;
	Mon, 18 Aug 2025 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRwyKvkF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0831B118
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516566; cv=none; b=YHGz9pdXB26O5CqlAgs5CvwNR2g5/xVpmrWlEcjnpTr/CloHkyPhQOc99SlBKazG4etSKtAXtSZyZwagX0oG3wEewPQrCUsT49jZ/ZVaBZNV5WBwuDv/glZ5HzmXMtnCU+Usp/RC4dxAfawZwCxJYwnFVUFLDxI6kH7xQWABLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516566; c=relaxed/simple;
	bh=7B3gclggDJWoxbQE4JKo+tJE5uxJsAfMBTzQgR7VYNo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FpkDhYtERrTYafdYF6RF/xfHuqnzsLqC6trcfMArormgmQ5jtWJOl75QrfhLjG+c5EUxyR+IFpX4pD3pghnp43hqamRq0v4q4u/+Id0orhXMhjfuOALaps3Bg0ZdsxRbdR2PgcYdACYWLon6ija52Z93JFsWTTqHUasvGZvOjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRwyKvkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F451C4CEEB;
	Mon, 18 Aug 2025 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755516566;
	bh=7B3gclggDJWoxbQE4JKo+tJE5uxJsAfMBTzQgR7VYNo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=CRwyKvkFhvh5uQOBb/qIvMskDE/XxCKeMhTAK5QOZVR0fI6swi+o6R/+b+s2EPkYd
	 CZyM6io9HvrFW8xPGsmi5StEJihRpIqUzCnXg0/jjfgn6CM+/OOJ+uK8Sx8R96N6fV
	 dj7BwwCKn6UvNhHSM4pEBiWzH8GOITzOXetQhVmu2EYKpfU4exur6q8vf5lyNu0k6o
	 NqQ39qSBXsV02N0yCkp1Ur0yYA2+mvcpeFy1mPIaQsr11/ESWiPUE/c00lvfSXGWl5
	 tIqP50jdt4169KRtFCG3QX95Ip9RquylqITfJf6hAw/QCZ6NLmA2hYf11HXrP2nNkV
	 ZJBJ7HI6wNvKg==
Message-ID: <ddedadfb-2462-43be-9b34-f53dc28051a5@kernel.org>
Date: Mon, 18 Aug 2025 13:29:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [bug report] media: cx18: Access v4l2_fh from file
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <aKL4OMWsESUdX8KQ@stanley.mountain>
 <3wa4mdkewrgsmt6bdhhm5kuhkpso5lltj6e3zpfpjz2qyizkkk@7e3wxcrgycqx>
Content-Language: en-US, nl
In-Reply-To: <3wa4mdkewrgsmt6bdhhm5kuhkpso5lltj6e3zpfpjz2qyizkkk@7e3wxcrgycqx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 13:17, Jacopo Mondi wrote:
> Hi Dan
> 
> On Mon, Aug 18, 2025 at 12:54:00PM +0300, Dan Carpenter wrote:
>> Hello Jacopo Mondi,
>>
>> Commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file") from
>> Aug 10, 2025 (linux-next), leads to the following Smatch static
>> checker warning:
>>
>> drivers/media/pci/cx18/cx18-driver.c:1223 cx18_init_on_first_open() error: NULL dereference inside function
>> drivers/media/pci/cx18/cx18-driver.c:1229 cx18_init_on_first_open() error: NULL dereference inside function
>> drivers/media/pci/cx18/cx18-driver.c:1230 cx18_init_on_first_open() error: NULL dereference inside function
>> drivers/media/pci/ivtv/ivtv-driver.c:1313 ivtv_init_on_first_open() error: NULL dereference inside function
>> drivers/media/pci/ivtv/ivtv-driver.c:1319 ivtv_init_on_first_open() error: NULL dereference inside function
>>
>> drivers/media/pci/cx18/cx18-driver.c
>>     1214         /* Set initial frequency. For PAL/SECAM broadcasts no
>>     1215            'default' channel exists AFAIK. */
>>     1216         if (cx->std == V4L2_STD_NTSC_M_JP)
>>     1217                 vf.frequency = 1460;        /* ch. 1 91250*16/1000 */
>>     1218         else if (cx->std & V4L2_STD_NTSC_M)
>>     1219                 vf.frequency = 1076;        /* ch. 4 67250*16/1000 */
>>     1220
>>     1221         video_input = cx->active_input;
>>     1222         cx->active_input++;        /* Force update of input */
>> --> 1223         cx18_s_input(NULL, &fh, video_input);
>>                               ^^^^
>> The patch adds a new dereference of "file" but some of the callers pass a
>> NULL pointer.
> 
> smart smatch! Indeed the DVB layer calls the ioctl operation handler
> directly, without a valid file *.
> 
>>
>>     1224
>>     1225         /* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
>>     1226            in one place. */
>>     1227         cx->std++;                /* Force full standard initialization */
>>     1228         std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
>>     1229         cx18_s_std(NULL, &fh, std);
>>     1230         cx18_s_frequency(NULL, &fh, &vf);
> 
> And I guess the same reasoning applies to these two.

ivtv does the same (cx18 is closely based on ivtv).

Regards,

	Hans

> 
> I'll send a patch right away
> 
>>     1231         return 0;
>>     1232 }
>>
>> regards,
>> dan carpenter
> 



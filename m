Return-Path: <linux-media+bounces-48391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6ACACF66
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F88A301D9F3
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836793128DC;
	Mon,  8 Dec 2025 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcrkwxH1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F486331;
	Mon,  8 Dec 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192365; cv=none; b=dcXlmih9taRyjphbPWHclDvsNvjyemWGy0LFw9ZQPryw4Fd1rLezo8Y84OBIQhcdECIQExtfnH78wPIEg7ArDYBkANVQyDWn3ORyaRxXn9VLeCOKA9fib9ioUxPdWGYfNl3Flg6nle8YbDkzML6VVUvhpNhKLjn7UrHI0oJBvOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192365; c=relaxed/simple;
	bh=ws3vZtn6Sg1vffHndnGTK3LdQzV9c4BEEfcicCq/QUY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TTSQPs/8pvDsbHIr/6qMoDBcZv0u64xEUbUKNucN2sJzLRahTogT+UPDd9TsUZNxZODfsqXurLXAcpZGWy2K9/LwycJuC2ksNr60J6SJZOu+olXb9Rpw4U5DwzbrJL7rOZ0qcWC0D/EuejqCP6cVszd7wKdGDtLepdrnsB+8hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcrkwxH1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B7C4CEF1;
	Mon,  8 Dec 2025 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765192364;
	bh=ws3vZtn6Sg1vffHndnGTK3LdQzV9c4BEEfcicCq/QUY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qcrkwxH1C/7plRy81GlwpgoYg173D+V+bfbTcuGZBb+KhZv1KbQLQqGB5u7wCCMRE
	 sXjEceTfNXyzfIJlfXuMrgqnJ03iUPJaVZWZY/beWTazVAdsq89MWSq8iOdof1Sd2e
	 kOV76E8BjDiBG+yoJhXVz0U7XT47VIppwAGlp0rNrZQrNHgMrxyVmToOE/abGpqwQe
	 yMMS8Nk3rx2q/sZOet79x4jrA1pZg+hoVGWEkH5gbJkRJav/MpHpJ6hAI8OxZSXjfo
	 4kocYtahuRdDlC5ZzvIK5gVJa5RjMkf3WONQA7MUYnxuRccrc3Scty0aq7Qn3yHfSU
	 m1n6tsa29rQVA==
Message-ID: <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
Date: Mon, 8 Dec 2025 12:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Import standard controls from
 uvcdynctrl
From: Hans de Goede <hansg@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Manav Gautama <bandwidthcrunch@gmail.com>,
 Martin Rubli <martin_rubli@logitech.com>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org>
 <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Dec-25 12:02 PM, Hans de Goede wrote:
> Hi Ricardo,
> 
> Thank you very much for doing this, this has been on my own TODO list for
> a long time, so it is great to finally see this happen.
> 
> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
>> The uvcdynctrl tool from libwebcam:
>> https://sourceforge.net/projects/libwebcam/
>> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
>> ioctl.
>>
>> The tool has not been updated for 10+ years now, and there is no reason
>> for the UVC driver to not do the mapping by itself.
>>
>> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
>> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.
> 
> ...
> 
> Question what happens if uvcdynctrl is run after applying this patch ?

Answering my own question here, we will hit:

drivers/media/usb/uvc/uvc_ctrl.c: 3166:

        list_for_each_entry(map, &ctrl->info.mappings, list) {
                if (mapping->id == map->id) {
                        uvc_dbg(dev, CONTROL,
                                "Can't add mapping '%s', control id 0x%08x already exists\n",
                                uvc_map_get_name(mapping), mapping->id);
                        ret = -EEXIST;
                        goto done;
                }
        }

So uvcdynctrl will see an EEXIST error. I think we need to add an -EEXIST check
to uvc_ctrl_add_mapping() )or uvc_ioctl_xu_ctrl_map() which is the only caller of
uvc_ctrl_add_mapping()) and if -EEXIST is returned do a uvc_warn_once() that duplicate
mappings are being ignored and return 0 instead of -EEXIST to avoid breaking existing
userspace.

Regards,

Hans




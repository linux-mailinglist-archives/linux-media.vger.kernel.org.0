Return-Path: <linux-media+bounces-62144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhjC/llDGpXggUAu9opvQ
	(envelope-from <linux-media+bounces-62144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:30:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663457FAF9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 936DB3038D47
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C93D4028D8;
	Tue, 19 May 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiXoKaX0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633594028CC;
	Tue, 19 May 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196805; cv=none; b=ReTWdMBygUqVSUow2is647k4ZrYeg7ffXXLef2SmW2OlTNhOUg29jin3sOiZ3ZhdnWq48IutCppMF1DCoZ8Gw2oGFowtIYVX462HQVwlSRZ3j/Oe/6lLxjCa6/kYADYMhcx3/hbompnEMEgZlgCfcwVn2wYlI5FTZncjMKSCR6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196805; c=relaxed/simple;
	bh=qTM47OyfEJQTBaLMx7TBKu/19Kx/FSvRnxlN6ksSHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gysIkv5b/vSAvwtvf/ipKZwAuGN7m7Gv9tVrS1snFNon11SuwwQkkonvtJIm1fDjToAsBg1bjDqwUxmNzZyMCFFulrjbKyF8OEzd5cIDGxzVXaxyMAT9phWN+xVE2GN2/6uC2qEDeCJ+oluz7Tp5pfZBUA1lDN/tr5FFkX0ry5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiXoKaX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8444FC2BCB3;
	Tue, 19 May 2026 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779196805;
	bh=qTM47OyfEJQTBaLMx7TBKu/19Kx/FSvRnxlN6ksSHt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oiXoKaX0iCOsppnlybgYplqvwyLn+eCh1zCi3/t4R8Gmazpme9mpxmpiSxQ3LEv4o
	 1ygQhT6xGzBZyqNsVEHkuUwKQ7+3QTKtIXDzcPeanNsWB0rPxxtMrbAunGEFkbyKE4
	 K8SdNHH7Jppf81aN6xRsC1Q5clAOpA0zbj1XtQIgnOO6wLbcRcJSwurUgqRYzjfJf4
	 m7UJVpJ51A0izjeHfINQMaRU+TzyDgi7vw/DG2QSkj6KYfA0xgU4uTEz6rf52NKS9y
	 rhAf3xYQZEOPl/AWjveuKE3BmYHGlkki4SSCUJz1Syrp9CPha3klB9O6at937WSjvk
	 p3McNalA4rh1Q==
Message-ID: <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
Date: Tue, 19 May 2026 14:20:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com>
 <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62144-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3663457FAF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 13:51, Guangshuo Li wrote:
> Hi Bryan,
> 
> Thank you for the review and for pointing me to the mxc-jpeg cleanup
> path.
> 
> On Tue, 19 May 2026 at 18:09, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> OK so this will get the same feedback as the Iris version which is
>> please fix the cleanup path.
>>
>> If we look at drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c we can see
>>
>>           ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, -1);
>>           if (ret) {
>>                   dev_err(dev, "failed to register video device\n");
>>                   goto err_vdev_register;
>>           }
>> <snip>
>>
>> err_vdev_register:
>>           /* Only release if allocation succeeded but registration failed */
>>           if (jpeg->dec_vdev)
>>                   video_device_release(jpeg->dec_vdev);
>>
>> So for Venus and Iris
>>
>> err_vdev_release:
>>          if(vdev)
>>                  video_device_release(vdev);
>>
>> i.e. only release the video device on the error path if the vdev pointer
>> is non-NULL.
>>
>> ---
>> bod
> 
> I agree that the mxc-jpeg pattern is useful for avoiding a double
> release when a video_device has been registered successfully and a later
> probe step fails. In that case the cleanup path does:
> 
>          video_unregister_device(jpeg->dec_vdev);
>          jpeg->dec_vdev = NULL;
> 
> and then falls through to:
> 
>          if (jpeg->dec_vdev)
>                  video_device_release(jpeg->dec_vdev);
> 
> So the NULL assignment prevents the already unregistered video_device
> from being released again by the later shared error label. That makes
> sense for the "registration succeeded, later cleanup failed" case.
> 
> However, the issue I am trying to fix in Venus happens before
> video_register_device() returns, when video_register_device() itself
> fails after reaching device_register().
> 
> The problematic path is:
> 
>          venc_probe()
>            -> video_register_device(vdev, VFL_TYPE_VIDEO, -1)
>               -> __video_register_device()
>                  -> device_register(&vdev->dev) fails
>                     -> put_device(&vdev->dev)
>                        -> v4l2_device_release()
>                           -> vdev->release(vdev)
>                              -> video_device_release(vdev)
> 
> At this point, video_register_device() returns an error to venc_probe().
> Then the current Venus error path continues with:
> 
>          venc_probe()
>            -> err_vdev_release
>               -> video_device_release(vdev)
> 
> So the same video_device can be released twice.
> 
> In this path, adding only:
> 
>          if (vdev)
>                  video_device_release(vdev);
> 
> would not avoid the double free, because vdev is a local pointer in
> venc_probe(). It is still non-NULL even if the object it points to has
> already been released through put_device(&vdev->dev) inside
> __video_register_device().
> 
> So I think the mxc-jpeg cleanup pattern handles a different ownership
> transition: it avoids releasing a video_device after a successful
> registration has later been undone with video_unregister_device(). The
> Venus issue here is about the ownership state when video_register_device()
> itself fails after device_register() has already taken and dropped the
> device reference.
> 
> This is why the patch temporarily uses video_device_release_empty() while
> calling video_register_device(). With that, if device_register() fails
> and the V4L2 core reaches vdev->release(vdev), it will not free vdev.
> Then the Venus err_vdev_release path can still release vdev exactly once:
> 
>          venc_probe()
>            -> video_register_device()
>               -> __video_register_device()
>                  -> device_register() fails
>                     -> put_device(&vdev->dev)
>                        -> v4l2_device_release()
>                           -> vdev->release(vdev)
>                              -> video_device_release_empty(vdev)
> 
>          venc_probe()
>            -> err_vdev_release
>               -> video_device_release(vdev)
> 
> After video_register_device() succeeds, the patch restores:
> 
>          vdev->release = video_device_release;
> 
> so the successfully registered device keeps the normal lifetime handling.
> 
> Please let me know if you think this should be solved differently, for
> example in the V4L2 core instead of in the Venus driver. I would be happy
> to rework the patch if there is a preferred approach.
> 
> Thanks,
> Guangshuo

Yes I take your point.

So what you are describing is an error in the software contract from 
video_register_device() - if we look throughout the usage of that 
function we see either the pattern we already have - not checking for 
NULL or checking for NULL - not the double free case you are addressing.

So really the fix - the place to litigate this is not in Venus or Iris 
but in video_register_device's cleanup path.

---
bod


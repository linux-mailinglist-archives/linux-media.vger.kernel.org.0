Return-Path: <linux-media+bounces-37516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81AB01E4D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBF85A5B2C
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D192DE6F0;
	Fri, 11 Jul 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvI7nZav"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276E2D780D
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241882; cv=none; b=Z3pDJ1a4EcTYMxdq07jhtWmAaz1fJSNPvHm2WAfZY+IYXCqOAOjiJWCQa2fY53Mvy8tWSOFD7S+uhuMDwPx9Yhwlu9UBMiPS7esOZqSaigRAdoH8eJK83qyotGU/Y9yXjTQlsWnrf1OTbZq2TPqlCElBzE6VDp4L/2oA5/gDmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241882; c=relaxed/simple;
	bh=DPD9BC3BQF4Gnxt6D36cYT30e6X5ouEEBecpfP/q/5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWCr66Md3+Uhyd/xhgYB2FAyobV4WUGznjN8tDv4VxUcPWyzER3CPE9Z768YYW8lNRJR44G+44MUqRR7wC6zbbic9HGCV0lrYZpU3W54xX8ztmnoT2D/Mog5FlMcRDTLVmTm04lwKmzx4t+G/s0zb40tcyjDb0ScmlvGCj+XtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvI7nZav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7961EC4CEF5;
	Fri, 11 Jul 2025 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752241882;
	bh=DPD9BC3BQF4Gnxt6D36cYT30e6X5ouEEBecpfP/q/5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvI7nZavCm1cyNkBoTz+PRsd7LYU1txXQrxwBUv69aIEQABiAMxKIrmmpg8FLJdoc
	 CNCDxqsRT4O/GtCZ/URZLtyk9jyorDOxw6cKcvpIU30ZHGn1Cgq4pv0cXROYOipT5q
	 xn1/xhNHTZbKWorbRr1Wo+TgmJEqZoeF6CwgQc5+zFEEKNdOOf0ZcSOoVDnTyUz4KO
	 WfS3gYkdhBomAD8t520alN2FnS0Sg08OLJ92p016jakjnlacwnP4sw27tpvyd2Rsgp
	 fzx1f8cZz37RbwaG0zxMGho9QtiwdDsQq04Ba9b8dFuQmOcJueiC3jM1RGzdPB3Dfl
	 F6mKh1PujwBKQ==
Message-ID: <5130323f-75d6-4ef6-a1aa-c1d5f03fcbc7@kernel.org>
Date: Fri, 11 Jul 2025 15:51:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Use a count variable for meta_formats
 instead of 0 terminating
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
References: <20250708104622.73237-1-hansg@kernel.org>
 <20250708104622.73237-2-hansg@kernel.org>
 <CANiDSCvNJbJyq0Ur5kp8JxbOkasvET=j008P80WSdbyt31vZYA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCvNJbJyq0Ur5kp8JxbOkasvET=j008P80WSdbyt31vZYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 8-Jul-25 1:42 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> Indeed it looks nicer, thanks :)
> 
> On Tue, 8 Jul 2025 at 12:46, Hans de Goede <hansg@kernel.org> wrote:
>>
>> The code dealing with the 0 terminated meta_formats array is a bit klunky
>> especially for the uvc_meta_v4l2_enum_formats() case.
>>
>> Instead of 0 terminating add an unsigned int nmeta_formats member to struct
>> uvc_device and use that. This leads to slightly cleaner code.
>>
> Reviewed-by: Ricardo Ribalda <ribalda@chrium.org>
> Tested-by: Ricardo Ribalda <ribalda@chromium.org> # Camera with MSXU_CONTROL_METADATA

Thank you. I've pushed this to uvc/for-next now.

Regards,

Hans




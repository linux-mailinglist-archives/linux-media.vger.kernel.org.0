Return-Path: <linux-media+bounces-14091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49D91607D
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1091F21147
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32AB146D59;
	Tue, 25 Jun 2024 07:56:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC3144312
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302187; cv=none; b=CxMxiOubf2/dtVwk9RbcdobG9v5pTKstcYfay9PDSkRb848g6rv+I/ZhqRtgrYAX42t3qcXIOJuPQRc+/0/GkIQmOO7Ard5Xlt6B0gmzEhjUdMxxsUKbw7BP0PpyoDupcYu3L28exCA3JbxL6PuoUCTWOvMU+4f11dv5PvQuDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302187; c=relaxed/simple;
	bh=LUAhSbxLbO2XzA17QdFkuR+oSpe6woVBN74dxt4bcAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDySnywkqyN6KVcvqRjZ9BRYot8wTonkY6hXTxgc0J8QIKkNa8S95Y0bh9bv3MWwBUbiLA9FbVb2BvqIU9XDymxv4CfoPiXbkurvuOVEgh0FJl7Fc3HY7GjXK2M+S+DKUjMIgAQN6SHpnaE9T34tAhfePzIoLf1xZ/D1dptJJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03529C32781;
	Tue, 25 Jun 2024 07:56:25 +0000 (UTC)
Message-ID: <0aae5a22-9c4f-45ce-ba34-2ddab250aac9@xs4all.nl>
Date: Tue, 25 Jun 2024 09:56:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add loopback support across multiple vivid
 instances
To: Dorcas Anono Litunya <anonolitunya@gmail.com>, linux-media@vger.kernel.org
Cc: jaffe1@gmail.com
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dorcas,

On 24/06/2024 11:52, Dorcas Anono Litunya wrote:
> Hello,
> 
> This series sets up loopback support for video, sliced VBI data and
> HDMI CEC across multiple instances in the vivid test driver. It also
> updates documentation to reflect changes made.
> 
> The first 7 patches do not implement the actual work but are necessary for
> setting up the next changes. They address documentation issues,
> fix a g_edid bug, resolve a vivid crash when no outputs are configured,
> and add the instance number to the video input and output enumerations.
> 
> The 8th patch adds the controls and infrastructure needed to enable
> loopback across multiple instances.
> The 9th patch enables the video looping code and CEC support.
> The 10th update documentation to reflect all changes made.

Thank you very much for all your work on this during your Outreachy internship!

It was a lot more complex than we initially anticipated, so I am very
pleased to see this patch series. It's a really nice improvement to
the vivid driver, making the emulation of S-Video and HDMI much more
realistic.

It was a pleasure for me and Johan to mentor you.

Thank you!

	Hans

> 
> Dorcas Anono Litunya (3):
>   media: Documentation: vivid.rst: Remove documentation for Capture
>     Overlay
>   media: vivid: Add 'Is Connected To' menu controls
>   documentation: media: vivid: Update documentation on vivid loopback
>     support
> 
> Hans Verkuil (7):
>   media: Documentation: vivid.rst: fix confusing section refs
>   media: Documentation: vivid.rst: drop "Video, VBI and RDS Looping"
>   media: Documentation: vivid.rst: add supports_requests
>   media: vivid: vidioc_g_edid: do not change the original input EDID
>   media: vivid: don't set HDMI TX controls if there are no HDMI outputs
>   media: vivid: add instance number to input/output names
>   media: vivid: loopback based on 'Connected To' controls
> 
>  Documentation/admin-guide/media/vivid.rst     | 185 +++++--------
>  drivers/media/test-drivers/vivid/vivid-cec.c  |  88 ++++--
>  drivers/media/test-drivers/vivid/vivid-core.c | 250 ++++++++++++++---
>  drivers/media/test-drivers/vivid/vivid-core.h | 125 ++++++++-
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 262 ++++++++++--------
>  .../test-drivers/vivid/vivid-kthread-cap.c    |  86 +++---
>  .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +-
>  .../media/test-drivers/vivid/vivid-vid-cap.c  | 115 +++++---
>  .../media/test-drivers/vivid/vivid-vid-cap.h  |   2 +
>  .../test-drivers/vivid/vivid-vid-common.c     | 134 ++++++---
>  .../test-drivers/vivid/vivid-vid-common.h     |   5 +-
>  .../media/test-drivers/vivid/vivid-vid-out.c  |  25 +-
>  12 files changed, 859 insertions(+), 423 deletions(-)
> 



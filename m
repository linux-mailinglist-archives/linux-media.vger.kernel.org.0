Return-Path: <linux-media+bounces-41985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E04B48B01
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30CB64E17A9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E742F83AE;
	Mon,  8 Sep 2025 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1c5gY4p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FA2F9C2D;
	Mon,  8 Sep 2025 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329357; cv=none; b=BQ5LW4wmIXwAPbMVVKrtI/sqYvXJujnNhb/KoJJ2LdQ9E+z2cxWvseWflV1BrYmobCMTHBdGR5T31Fou/Javwu+1QLHp2WKOYpvnpbKTrvc4f1RPyUbH3BEmjgHPt0lHkID/RJTfGal5TM9N26namvJVDBGvyee9yQbdiOg8qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329357; c=relaxed/simple;
	bh=4nK81TYvPdG99YY/+tikUPf7zc2e8byAQKqfO2orWEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blQ1wSLKLo053mCKBEP+v8dvfrTgjc8Q2RGdRGqk2S31iocJ+0Psq1/vd7nnhfm2koSpZDLN5MS8eK+TSbfqzoUYJ+q/6tY/40g9mcIscaN1udXM93xxu+YVj0B5BqIry+MW87PtorEbk06NDT456/wQ510co8D8JbCZvKQFpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1c5gY4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19123C4CEF1;
	Mon,  8 Sep 2025 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757329356;
	bh=4nK81TYvPdG99YY/+tikUPf7zc2e8byAQKqfO2orWEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W1c5gY4pprHH7R51xMcF2hV/8mA5FaxmvUfyeAv4RPp36cB7K3SfW3BQnZNU/St57
	 mN65n0h9Egb9dAXWkOwBj2ATi9nX+X5/Xs6jM5WlYEgWgoroo2d028oZq+ms2eps0Y
	 0GfTKn3NeLnONuYTt6dKT304Mpvkm9t8TUaExTaKw21yUf0ZOtZggMahzCn71Kosj0
	 ZKS21KH2q9ZIjAbe+igpGCwb8s7aWiZ049c4C+P6cZMnx4O0dOkbGMXxADHH26ltnA
	 TMswB6wwgazraMF4ORyuVMKFF5hSNAcjXf/RCmgCQnxzWY9BkSlfOvj+QcbVajGxss
	 QkgD+OGXAamdA==
Message-ID: <e3aa47fe-938b-43f1-b221-02e3e4c74243@kernel.org>
Date: Mon, 8 Sep 2025 13:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: uvcvideo: Run uvc_ctrl_init_ctrl for all
 controls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Aug-25 22:15, Ricardo Ribalda wrote:
> The function uvc_ctrl_init_ctrl() is called for every control for every
> entity, but it exits early if the entity is a extension unit. The comment
> claims that this is done to avoid querying XU controls during probe.
> 
> We only query a control if its entity GUIDs and index matches the
> uvc_ctrls list. There are only controls for the following GUIDs:
> UVC_GUID_UVC_PROCESSING, UVC_GUID_UVC_CAMERA and
> UVC_GUID_EXT_GPIO_CONTROLLER.
> 
> In other words, XU controls will not be queried even without this
> condition.
> 
> In future patches we want to add ChromeOS XU controls that need to the
> initialized. We will make sure that all cameras with ChromeOS XU can
> be queried at probe time.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index efe609d7087752cb2ef516eef0fce12acd13e747..ff975f96e1325532e2299047c07de5d1b9cf09db 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3181,15 +3181,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  {
>  	unsigned int i;
>  
> -	/*
> -	 * XU controls initialization requires querying the device for control
> -	 * information. As some buggy UVC devices will crash when queried
> -	 * repeatedly in a tight loop, delay XU controls initialization until
> -	 * first use.
> -	 */
> -	if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
> -		return;
> -
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
>  		const struct uvc_control_info *info = &uvc_ctrls[i];
>  
> 



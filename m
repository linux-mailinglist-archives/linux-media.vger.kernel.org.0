Return-Path: <linux-media+bounces-57646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBbBBBSaymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:43:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA3735E14A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 161BD309F465
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736DA3624C1;
	Mon, 30 Mar 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXy980Ls"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4EF2E7BD3;
	Mon, 30 Mar 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884892; cv=none; b=JLbfezLyJf1cg9k1s0ZyWw/2p29EqYovkGJ+UW3wnbL4BdevH2ZD/tzTl2hSBtyQJBrRC/hZIly7s0UQCsdOWE+BLEmENawZJuJ4wvyMfTVG+g4HtwMc2P6WjNJ5P1mU0VMJql+aV4djnNQnqwjDcj+/5AJWrzYctmLHmFaBfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884892; c=relaxed/simple;
	bh=NAqKoRtakA2OWEx4cEvmQBQJs5ge/3kOqZu8kAc9Cdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COIBYeHUZFUpAG6qFsNR7u8mpHnHjjluEZIbrFxRi5YWQpRlLXg7bZLyoiBOxvk6T4uh+KGqKiKYycNS5q80Fv3BNMx6f4UTBa/n80+zwaqmkqlwTdv7WeXuBXP/D1na0WCjoPyDBjprXgLqBgD4xIg+zuuk5Cj5PF0V4OgTswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXy980Ls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D19C4CEF7;
	Mon, 30 Mar 2026 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884892;
	bh=NAqKoRtakA2OWEx4cEvmQBQJs5ge/3kOqZu8kAc9Cdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qXy980Lskuaol7cvS6OAXxPJ0zAhExhCksFwCRttOZXaeQdmUG7bBEr3KUS4B8sej
	 PR3y1CtsU8DeKmfLDpCQBrscHDtvNJoPSMoqvYTPdxDVBRAIxtCPjmlBpLx5ZGz1I9
	 fMTMa3GSNB7/3HQfFhr6HJXgSpQejiu6vt5JRsJGW3ndBCMxtjpeHK8j9/9N2QGFBi
	 gvYWot+lw2vZ+mQ75R/pBAdfUb3BuMzEct0I2jHLZ/I9nESfQ33ojRuSNuZiDV0dy0
	 AoJRc1GyAEd8EDuPSt1SuDn1sNqemWujL2DLF4MTUCyS3IP1K5wvksmZj5tCemN/4b
	 6i82w+Qm54uUA==
Message-ID: <556dc20a-9b5f-47ef-8182-9be7c4e39e8a@kernel.org>
Date: Mon, 30 Mar 2026 17:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] media: uvcvideo: Fixes for frame sequence number
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57646-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DA3735E14A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 23-Mar-26 10:53, Ricardo Ribalda wrote:
> This series fixes a couple of corner cases where the frame sequence
> number is not properly handled.

Thanks, I've applied this to my local uvc/for-next branch and will
push this out later today.

As mentioned in replies to the individual patches I did squash in
some small fixes.

Regards,

Hans



> 
> Please note that the first patch has not been tested in a camera
> without EOF. To emulate it I have used this:
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index b66d701f2582d..097bed2f7845f 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1360,6 +1360,8 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
>  {
>         /* Mark the buffer as done if the EOF marker is set. */
>         if (data[1] & UVC_STREAM_EOF && buf->bytesused != 0) {
> +               printk(KERN_ERR "Ignoring EOF\n");
> +               return;
>                 uvc_dbg(stream->dev, FRAME, "Frame complete (EOF found)\n");
>                 if (data[0] == len)
>                         uvc_dbg(stream->dev, FRAME, "EOF in empty payload\n");
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5 (Thanks Hans):
> - Swap order of patches
> - Remove duplicated conditions.
> - Link to v4: https://lore.kernel.org/r/20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org
> 
> Changes in v4 (Thanks Hans):
> - Fix 2/2 logic.
> - Link to v3: https://lore.kernel.org/r/20260316-uvc-fid-v3-0-c793354469b5@chromium.org
> 
> Changes in v3:
> - Fix typo in commit message.
> - Add new patch
> - Link to v2: https://lore.kernel.org/r/20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org
> 
> Changes in v2 (Thanks Laurent):
> - Improve commit message.
> - Remove original timestamp and sequence assignment. It is not neeed
> - Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org
> 
> ---
> Ricardo Ribalda (2):
>       media: uvcvideo: Fix sequence number when no EOF
>       media: uvcvideo: Fix buffer sequence in frame gaps
> 
>  drivers/media/usb/uvc/uvc_video.c | 110 +++++++++++++++++++++-----------------
>  1 file changed, 61 insertions(+), 49 deletions(-)
> ---
> base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> change-id: 20260310-uvc-fid-e1e55447b6f1
> 
> Best regards,



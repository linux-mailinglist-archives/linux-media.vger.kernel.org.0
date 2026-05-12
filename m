Return-Path: <linux-media+bounces-61211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOlNBRHTAmpJxwEAu9opvQ
	(envelope-from <linux-media+bounces-61211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:13:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEEB51B8E7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3596030323A6
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 07:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E98443636F;
	Tue, 12 May 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbVJBN7T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B299357CF0;
	Tue, 12 May 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569959; cv=none; b=qByoqeQcffzh40XmtW85BYDsT2s1bDnlxXcSP1JTd1vfm40qUTE0VXSACK8mqTGoCjOb3KGoNkffZhrtHzqt6QZv3bYPTMXyuBtwaXbEkVO/R7WrycUPFKo5uQhlltGY3V15nHDKfi1OA7dLPqqKq9ax2su11Mb0MRv1spPA6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569959; c=relaxed/simple;
	bh=amcrQ3v2kSJPgYiVkZ++GNcRSUY0DFIA4SwNZGlg+Cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pmN/p3gCPBSiOD69u9re50ipmpGCP9nbeyRCGBsY6Sd0X0tY9CBp27ws5U3JMLcTVo9S9/Z3zGkfcs1RULYMv5gYkskFg+R1I0UcPg+GdOCzauvrz/EuBHnkwbvPdUifJ2JEtb4lBPr5F0Rv4fQFL1849TSCmMjS56GY7dqW568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbVJBN7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D1EC2BCB0;
	Tue, 12 May 2026 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778569959;
	bh=amcrQ3v2kSJPgYiVkZ++GNcRSUY0DFIA4SwNZGlg+Cc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=BbVJBN7TmXlMBLCH7oOA2fZNFfb9/+A/rSw0VsPtOBCCNLDHr6DBHWh1JtbdLyLnh
	 bo7x2+NlRJ8wmroDxhKOn4y0zuTuagx7fabmHcOXMEcZrvpH4UsV/DRcop/hSI/E5N
	 +yvOUiPouodq4xcAtb2FgBLMMtvW3uW/F0NAfxkDLoU+tHLOKUtDww+HqPauoHiepm
	 tOzL8rOa+gnxezKx2wn/VqA1+YhwMBphnL6crh2PeeaHVyGaN+XaLbTBTaxLJ4esgu
	 DxQpaRTBL4l3yYQ/4so+yDqnAAXT9vYxUMLR/OgkN64p/+ZJoj07CnT+0IJ3dLqn7n
	 ZKiIO5/6hkENw==
Message-ID: <ae008f16-acde-4ba9-8eff-6146bb0a931c@kernel.org>
Date: Tue, 12 May 2026 09:12:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 1/4] docs: fix repeated word 'that' in userspace-api
 documentation
To: Adrien Reynard <reynard.adrien.08@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508163756.16213-1-reynard.adrien.08@gmail.com>
 <20260509143043.16403-1-reynard.adrien.08@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260509143043.16403-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6CEEB51B8E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61211-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,englishcolege.com:url]
X-Rspamd-Action: no action

On 09/05/2026 16:30, Adrien Reynard wrote:
> Remove duplicated word 'that' in two places in the V4L2
> documentation files vidioc-g-ext-ctrls.rst and
> vidioc-subscribe-event.rst.
> 
> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    | 2 +-
>  .../userspace-api/media/v4l/vidioc-subscribe-event.rst          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b8698b85bd80..8d5db414f8fa 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -64,7 +64,7 @@ should re-allocate the memory to this new size and try again. For the
>  string type it is possible that the same issue occurs again if the
>  string has grown in the meantime. It is recommended to call
>  :ref:`VIDIOC_QUERYCTRL` first and use
> -``maximum``\ +1 as the new ``size`` value. It is guaranteed that that is
> +``maximum``\ +1 as the new ``size`` value. It is guaranteed that is
>  sufficient memory.
>  
>  N-dimensional arrays are set and retrieved row-by-row. You cannot set a
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
> index a6fc3c5fe99d..845a90573e54 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
> @@ -94,7 +94,7 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
>  	a V4L2_EVENT_CTRL to be sent back to that same filehandle.
>  	Normally such events are suppressed to prevent feedback loops
>  	where an application changes a control to a one value and then
> -	another, and then receives an event telling it that that control
> +	another, and then receives an event telling it that control
>  	has changed to the first value.
>  
>  	Since it can't tell whether that event was caused by another

This is actually correct English:

https://englishcolege.com/is-that-that-grammatically-correct/#:~:text=Yes.,specific%20(as%20a%20pronoun).

Rejecting this patch.

Regards,

	Hans


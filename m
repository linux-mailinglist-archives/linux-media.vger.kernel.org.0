Return-Path: <linux-media+bounces-47233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF3C663A4
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 22:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AF8E4EE340
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC9A34C9AD;
	Mon, 17 Nov 2025 21:11:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7039B3002AF;
	Mon, 17 Nov 2025 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763413863; cv=none; b=JBhPys6jDwfX4nLqrjJgrhS60CxRQG+DKe4yFLHgeucpkz2XB9ldpRf2npOQNhi+gWzvZyJIbS8XnlsBuQ/g0Pf2+rDuwO75SiJXjSvIn8UJudBWFk1qf5Yol1DTCdRuHjeNikTWR5zx0Wc+nGM6jJ3kFyWBcFp9lQCYmaDq01o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763413863; c=relaxed/simple;
	bh=6RlndUgkHiJikKeQdeXj+I1yMu/KsksJv7GtP0Qlftc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IzA399iloDuAA9XIWEk0YjFp94QNI5PUWrAror1tHZm1RhHm6S6+toQA4ZsTlhnEiUSicHHpCi0TnYVWlVtNtdYghLQpXmTNCot/vAjKMkozVOReaGOSG9VvEx7DUXPgaYT4IeeZ2oL2Rr2I76asUGj9KHHLY//oK1Xalsi2XQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008311F.00000000691B8F5E.0032D4B8; Mon, 17 Nov 2025 22:10:54 +0100
Message-ID: <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Mon, 17 Nov 2025 22:10:53 +0100
In-Reply-To: <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Mon, 2025-11-17 at 20:14 +0000, Ricardo Ribalda wrote:
> +	if (uvc_is_privacy_mapping(xmap) && !uvc_allow_privacy_override_param) =
{
> +		pr_warn_once("uvcvideo: Privacy related controls can only be mapped if=
 param allow_privacy_override is true\n");
> +		return -EINVAL;
> +	}
> +

To really prevent the LED from being turned off, it should also be
added to uvc_xu_ctrl_query.

But why has it become so important after 10+ years that it cannot be
turned off on Linux? What has changed?
The majority of users use open-source software, they can view the
source at any time.


Gergo


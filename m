Return-Path: <linux-media+bounces-34828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49FADA2C0
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 19:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61E416CDBF
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A494D27A918;
	Sun, 15 Jun 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="usRbzJ+H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E547614F98
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006886; cv=none; b=JPT23dBjoc7lvLR6R0h+ql/y7yT4/EK8bWCqThV/X2BYJ7qmyda1RQLtkvlm5CJmNIl2pTfblUEvWGWM8bt7nnHYWtIerkgvYHp4GkKhLN0Z+n9vJa8q6aRTkTB/fTgRuCyk6HBmv3dOvA7SpA5y6t5So41s8KwWOIacata6YlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006886; c=relaxed/simple;
	bh=Deap5p23ruaex0RJK8sc/g/ZDjxJu9aMA33LZ3chNd8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBjF3L3/DrjiXZoZMEekRHFOIHIPLXcIh5U0D2xrf1SYXByHLcVCNbxh92GiJkX6/EzFeSuHe3DHiIHVT8PVF8LWZWyn8n7XxBY2kY2vAq0kraClWpNouWSWMB1dev04j7x5uLCK1CjRgfFI691USyN3GYrbxKpGTzZvkwMRTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=usRbzJ+H; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750006867; x=1750266067;
	bh=OOVTFpWI7ovtgwTDrRAWAySylIy1WZNgMwF2vC6UhLg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=usRbzJ+HvMnGSBNbYMUd1uLSymk9UBQF1OsY5ZtKPB7eJpMdDSsahQgYrE0DU5Dlt
	 RnlmrptJZ/8W3nyIp26HLLtj4II84m7Af53VfRhqIP3W2zoBKZYOP9KcBlOgLJcxu7
	 ioBmXRu4pSReIPfsPbWnT2ibEYNsFEV58cobFRGN4bfA9RPUc4k253CSm+TyZDSKoH
	 baOB05U0uvYsELT3rT7cTxC8Q40HNCx6CbrfFW1Z2UXA+GyKZh/BenTYVmfVDDOUY9
	 UieDKNzjL+XbCzLfZyDjcuG32/EYnuriwAgm1svSrg9glVxYZMcZ9GuBeGgWSqKPqh
	 0Bj6ybE+wavCA==
Date: Sun, 15 Jun 2025 17:01:05 +0000
To: linux-media@vger.kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4l-utils] qvidcap: Fix video capture being transparent on Wayland
Message-ID: <09f07fa9-c7b5-423b-a63b-4cfc890bcf46@protonmail.com>
In-Reply-To: <20250614134523.695131-2-mavchatz@protonmail.com>
References: <20250614134523.695131-2-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 794428bd07be5c345159aac4461d92f7c9b37e39
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-06-14 16:45, Mavroudis Chatzilazaridis wrote:
> When a non-alpha capture format is used, the default value of 0.0 causes
> the capture to be transparent.
>=20
> This issue is not apparent on X11 due to Qt not negotiating a format
> with alpha by default.
> ---
>   utils/qvidcap/v4l2-convert.glsl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>




Return-Path: <linux-media+bounces-43842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716EBC190E
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 54EE534E51D
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 13:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7333E2E11C8;
	Tue,  7 Oct 2025 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TLH71oMD"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB7EACD;
	Tue,  7 Oct 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845023; cv=pass; b=WDCl6CFHBvWuvO9pkcAJUfHGZFTFZ5wF4U2FO34Fh6Qxm+0vkxROkFZVpBray9tBsdkb8X+pn9dL9nJEDZDn4cZe7XPw42pAs6N6FB+zYyXgzA99OPVoEnnOWeB7S4hLxgCkas4m7iKZFAeFv+3dR7KJRN9wcVkssUeeW4omkbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845023; c=relaxed/simple;
	bh=OkNFH/nqsePn3oGUhalsEdhdzNYGtezdFARJ7qWpmiQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Y88g5f56grwKWeUy2OygdgIFJeBvXE0rshMiL6XyxbEB70Ix9fFfZ3SZm096YMy75kqEBbqV8E10/6sdRRZ3dK/VlQq/aplW8khoQU5lEdTE9LkpsyieGzV4IDMwdsNMk8jJ4Yxnn8ujahD6yjfaYTWogru6fmtdGSNIZ28rWtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TLH71oMD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759845006; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YUAk5pH7fqHpxxZPWCDbJNvNzDA7XFQeFI/B4fv9FdnyxN2TBfjsDClJDsk0Aumdn8yQbUNx6dLDBIAZJv/zBzUQXdKYrAldYK/ob/AUhs7WeZJYw0TFWlJ9h2Xau+bV3eE1F16vby14Lbu1JFkQWle1Sc4E9Uw+qZ4TzGYXpjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759845006; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OkNFH/nqsePn3oGUhalsEdhdzNYGtezdFARJ7qWpmiQ=; 
	b=fkCRkfrvrCSOl+AEdfr1ON8F9LFSY8mAJtVAjrQX8goSr1qp85RyFaKHPIA/zc4GIk2Q5Dj5v4O4KU7GiD0dYqLx+lNQFApmwvTJRAfD13ypO5e27BOKUtlp30/67E9mpGH1xXVvicI1lGGDfVSM82zFNmoSuMXrVPk4X+HUAbI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759845006;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=OkNFH/nqsePn3oGUhalsEdhdzNYGtezdFARJ7qWpmiQ=;
	b=TLH71oMDqOA/C8JhxPCRufR2o//Y3Dzy4vyHemzX+egJeX/F/aE79yVoSSg1a3Rp
	Bvvoz6NIZEo3LVLr7WvtfyZzo30OenQKr5yOdnS7Q0e0dTJhAEhDIdD65P16GvGWzH1
	sckq5Hfp/rGCrLfC+wJmazo11c4GeuBVIM0+Ur0c=
Received: by mx.zohomail.com with SMTPS id 1759845003566468.8128170090872;
	Tue, 7 Oct 2025 06:50:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in
 validate_av1_sequence()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAKPKb88VHwGp-iLMa=zZy3Czq8S8wUd9Zzkicvd4er9OiLg6UQ@mail.gmail.com>
Date: Tue, 7 Oct 2025 10:49:45 -0300
Cc: mchehab@kernel.org,
 hverkuil@kernel.org,
 ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com,
 yunkec@google.com,
 sakari.ailus@linux.intel.com,
 james.cowgill@blaize.com,
 hansg@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AB96B5A-1A80-4A8F-AE8B-787FF71C5A75@collabora.com>
References: <20250913105252.26886-1-opensource206@gmail.com>
 <CAKPKb882DgYB2fZXRDU_y1Xqz6GtFEErvzzET9eOAm=db0ns1g@mail.gmail.com>
 <873C85C5-2BCB-4631-BA18-919CE448A7CE@collabora.com>
 <CAKPKb88VHwGp-iLMa=zZy3Czq8S8wUd9Zzkicvd4er9OiLg6UQ@mail.gmail.com>
To: opensource india <opensource206@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 7 Oct 2025, at 07:50, opensource india <opensource206@gmail.com> =
wrote:
>=20
> On Sat, Sep 27, 2025 at 2:27=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> Hi, I=E2=80=99ll review this in the coming weeks.
>=20
> Hi Daneil, did you get a chance to review this?
>=20

Not yet.

=E2=80=94 Daniel=


Return-Path: <linux-media+bounces-43281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E213BA5BA6
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 10:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4492A54FA
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 08:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE3C2D594A;
	Sat, 27 Sep 2025 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="K69Kg00E"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F92D0C98;
	Sat, 27 Sep 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758963443; cv=pass; b=s+iA3RCTlFZSJz9wECHRoPW5uIi2Vme3QtHn0IiszMkzEEDOYc9jkFDBg4vzIZ7aNWH4ljuCxRZqzRHzkr6Nd3hWgFbWOtM2zFR0k3awpA66a7mewjryoI7FshsPd7Zld4ET4ymrVkf+Dp6hlhcYiLoi4+ls4h3UVgIJSd98JbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758963443; c=relaxed/simple;
	bh=31PDAq1j2yHrsOyxJvpl+PYWs/DRbGFfKUtWCCzqmNs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lG53t267j3FVURcMKTWUQ7Qo4jdVPsdW547aAA3XSQS+SNPjoX1RFJHL3bgSl6TzZp+XOFTAa1g9lDFxYAxtKvBT5/xn7b1GEqfLbgoI+gPNROFXxXNbTtsvQBrM2pPmxkhwcaRxy2WgFYdfRA95GR9lXsPjzhhGVlei+z3REJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=K69Kg00E; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1758963423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U9GTHb3BL1ACQuXAQdGaD6YV4mK/iou6rjkGzEhy7I4BICFDhy0DPRWZiUx7bCx6/Bd9YtooQ216pwXK+qk9pekFZLuxE4K1tafIrpJhVaSb2Gap6zK5lVcJCSAZOwJDULdATU30PlxNwfcjrM8IgGKGI4EBS1l1tb8Iur/hFy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758963423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WVKscjX/htp6TRcxxnzTBI72o6jOuvBFMEOm5t2DYw4=; 
	b=cUP66b/LEb3sjEyNsoqF31e9gBtcH1W95+ufOcp6vyDcbUrGd1EhIHXS+WBKprtEeoihYmKZOgTXhdyaNGDuNxKblPt0GgqkC2+4b7gAHSbElNrUNjVw5qg7A9fXZ9shDbjJ0bdpougyAI11Y+2sBYnI+jm3FdmPf5Nim3/bioA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758963423;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=WVKscjX/htp6TRcxxnzTBI72o6jOuvBFMEOm5t2DYw4=;
	b=K69Kg00Ene1HRcHbbzlE0SN2t3DuwOjcD/UOp8sYmAZKkigiSzI69SE0GUSYNCSZ
	cc9gQVJWpR65MynQGDR8T/uR/HGWLucKTBxAeqpC6JhJGbe5siNKXkVON0+9CTWxBIg
	YyJ1LPwWZ/KsxzMQ89lGTyHVTphXU75EHjEG7mGQ=
Received: by mx.zohomail.com with SMTPS id 1758963421740265.9635416776508;
	Sat, 27 Sep 2025 01:57:01 -0700 (PDT)
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
In-Reply-To: <CAKPKb882DgYB2fZXRDU_y1Xqz6GtFEErvzzET9eOAm=db0ns1g@mail.gmail.com>
Date: Sat, 27 Sep 2025 10:56:46 +0200
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
Message-Id: <873C85C5-2BCB-4631-BA18-919CE448A7CE@collabora.com>
References: <20250913105252.26886-1-opensource206@gmail.com>
 <CAKPKb882DgYB2fZXRDU_y1Xqz6GtFEErvzzET9eOAm=db0ns1g@mail.gmail.com>
To: opensource india <opensource206@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi, I=E2=80=99ll review this in the coming weeks.

> On 27 Sep 2025, at 06:51, opensource india <opensource206@gmail.com> =
wrote:
>=20
> On Sat, Sep 13, 2025 at 4:23=E2=80=AFPM Pavan Bobba =
<opensource206@gmail.com> wrote:
>>=20
>> Complete the "TODO: PROFILES" by enforcing profile-specific and
>> monochrome constraints as defined by the AV1 specification
>> (Section 5.5.2, "Color config syntax").
>>=20
>> The validator now checks:
>>=20
>> - Flags: reject any unknown bits set in sequence->flags
>> - Profile range: only profiles 0..2 are valid
>> - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=3D1, sy=3D1),=

>>   monochrome allowed
>> - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=3D0, sy=3D0),=

>>   monochrome forbidden
>> - Profile 2:
>>    * 8/10-bit: only 4:2:2 allowed (sx=3D1, sy=3D0)
>>    * 12-bit: 4:4:4 (sx=3D0, sy=3D0), 4:2:2 (sx=3D1, sy=3D0), or 4:2:0 =
(sx=3D1, sy=3D1)
>>      allowed
>> - Monochrome path (all profiles except 1): forces subsampling_x=3D1,
>>   subsampling_y=3D1, separate_uv_delta_q=3D0
>>=20
>> These checks prevent userspace from providing invalid AV1 sequence
>> headers that would otherwise be accepted, leading to undefined driver
>> or hardware behavior.

Mauro,

A reminder that I have been warning about this for quite a while [0], =
which
includes mentioning that patches like this, although welcome, do not =
solve the
root issue completely.

I keep working on what I believe to be the solution [1][2]. I would =
appreciate if
we could restart this discussion.

[0]: https://lwn.net/Articles/970565/
[1]: =
https://lore.kernel.org/linux-media/20250818-v4l2-v1-0-6887e772aac2@collab=
ora.com/
[2]: https://lwn.net/Articles/963966/



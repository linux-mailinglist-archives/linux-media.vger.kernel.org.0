Return-Path: <linux-media+bounces-11445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3AC8C5999
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 18:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52CEF1C20A5A
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 16:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332D8180A83;
	Tue, 14 May 2024 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TIonPCV6"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DE17F367
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715703433; cv=none; b=UkaP+u+gPKQDUVU9f+pY0MI42ypVgCDmLO6qM+PFN9NxzmzKwfgxKWpP80/3OBsoUrCLxr+jZ5MfaQ9zDmo1X4C661doLNT4wku1eOrwQtY8eU4pCOAS0gXOlikfROCyW13o6vpRc/RTY7Zp+B1Hf0SZ4RhUqoU9fOuXFvEoPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715703433; c=relaxed/simple;
	bh=kJmzx0lqfYWi0bxYk64x0zek2AhhuiWiDbfzenoWnIo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HQnZenB/KAHN8ayvauS4OCVBSpd7NsgvYwF1r5Q2rDVrMingd3E1uunTr0PLcusPAE9T8Xqp4GNVrQsxx1sn2NqhOl85EtE2NDh4U5K5yMYlck66aYYDGRWIjvvyY0jWnukc9ZPZgQleQ9n5/RNzKHnXEjC5REjMsMY7H/fyzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TIonPCV6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715703430;
	bh=kJmzx0lqfYWi0bxYk64x0zek2AhhuiWiDbfzenoWnIo=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=TIonPCV6E7t1oJD91XeWa51dEBkJXxjymCWAWevxZD1YXmVw9zkGgTDFGnqAvoxng
	 iXL0f3/hy8+bwfrl1BaTKm0Y1/YrAqHqpRvSObsPCRokGQPVbGIT2YmDYZtUFQ8lLR
	 P+aNP5kFPYbYaum+TN64qyiKqGdyW7r7tbBIjwDv4GHbiuGQRx0LfCRZCJPmws+I53
	 6EANt0hSO+2zhnrcZZVSOdz0cPQF5gpksXUBGfL7VhfA25iQbJPyWb5ydUTvzaMmkc
	 3ZzxgCtKswJZPgeSrS5tJY0qfOzszwpEQIQwvTsYf4AckKrolxMqwdcDDFnNfGU457
	 oR2wQ3jq2wB3Q==
Received: from smtpclient.apple (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D64C33780A0B;
	Tue, 14 May 2024 16:17:08 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Date: Tue, 14 May 2024 13:16:56 -0300
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi Hans, all,

I=E2=80=99d like to attend in person and discuss the use of Rust in the =
subsystem, especially in light of [0] and [1].

Please note that these are new submissions that are unrelated with what =
was discussed last year.

30 minutes will do.

[0] =
https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@colla=
bora.com/
[1] https://lwn.net/Articles/970565

=E2=80=94 Daniel



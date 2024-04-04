Return-Path: <linux-media+bounces-8651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D00898736
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 14:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2A9298884
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CFE376E2;
	Thu,  4 Apr 2024 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L8InK3Fz"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB385644
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233308; cv=none; b=ZZbOfmxQ+VmlQSfDz99MqxJUepRcarG4g6cljDMZQaDKKmbqibKN+DnJkE0ldXbmosP9ttyohuqBll4BwT//3//1FyZ5UT4PYh7HxX1F0uJznwCXiOibrr7iBVQh5m02jBUHmsK5pz1rAXzUoC/vRsDh32EZOj94L9cMXAEvm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233308; c=relaxed/simple;
	bh=+9PiagzdNHkxU6ilJHvhX4WhZu7txwLAUDMJhewmMTU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kmww2ldHaI6wlgDuayUZ5ExmNeF56RPf3F7StKUCA5wrA5rKSB9t9QnT7R5KR3HUAt08OrR2W2f/cdd6i61zsfkT5ip7VCWobkoqGPeXYoj0Y76Fk5aZIZEWLpOz0YaEaWDyWz+G5bEbJUSi1sTyj7Xro1g/ghDQ7lcQHntILSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L8InK3Fz; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712233304;
	bh=+9PiagzdNHkxU6ilJHvhX4WhZu7txwLAUDMJhewmMTU=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=L8InK3FzfIPDg6qZZdfvagUd5NmVSnaqtBDbSL9TsRStJs4t3ncbyI0LydpHgwEgE
	 ShXTfO6vYtlDMffo9GYQADh+Vp/BtP0G6J0geqf6tU/Oqy/oYdtXAHlrWnKs2AmVGg
	 +i+3tZ84288JhmzXW4L2E6R9DQjWiIx619UtOWvzrxH2fXnQybWpzbYyc8bWeIKMzR
	 yBpznbEm628ZdWmGDOJ2b6j2iiBLPbp7UeVJHfNp+uW+Ydydoyqrc5IVsHek54it1G
	 azMbYg8VztfbCgcSnpgL7OweXKd5Nmqcuyt/6EJ+fepXOWjdLzZO582X/pRnTA/JWu
	 uOBcKJNVhXkAA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0A4B37809D0;
	Thu,  4 Apr 2024 12:21:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [ANN] Media Summit 2024: where to hold it?
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240404100928.GK23803@pendragon.ideasonboard.com>
Date: Thu, 4 Apr 2024 09:21:26 -0300
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 =?utf-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD8F92F1-B464-4901-A5F5-56182ED87CED@collabora.com>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
 <20240404100928.GK23803@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi all,

Montreal would be a better pick for me, but Vienna also works.

=E2=80=94 Daniel



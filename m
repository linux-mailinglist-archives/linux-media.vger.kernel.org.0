Return-Path: <linux-media+bounces-11106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603398BEDDE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 22:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A61428680C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC4B14B968;
	Tue,  7 May 2024 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ayce0jpT"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854D14B940;
	Tue,  7 May 2024 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112470; cv=none; b=e1/mz8apJ34bN5mpoKjQ90Pth+ypVk3dl3OqMNrWQi5Hut3rhuz3ItxVw74Sx82mIsiN7NsYKVXk4uZPMe+yROGLZCILuTPJ6QoGt2NL2hSZfYuIQoKlDF5OCP39CKudo18Bu877KJDwE2Su5SttW9CtmW+EY5AjSlBtXFw9xH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112470; c=relaxed/simple;
	bh=fipWuacVxzVGjU5VN53PElEjG/EVMb8BJ11r6n3Qv6w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DNY0H8zqwvwtEsOq3DQkDawbI4Mj6682maltOl+AjIoZX/TvxAZRFnTT/KR7Gye2dA36TXbF1G0AdQPxCUvMrignG1wzg9NPv+3t5IJI9rCbtWV5SEwKT3mtCjcrVlRhmp4tjDpW6uA3WX/SJepT0tE3mBqrNaqPfCiV/7vPY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ayce0jpT; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715112466;
	bh=fipWuacVxzVGjU5VN53PElEjG/EVMb8BJ11r6n3Qv6w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ayce0jpTxn/KmZ5Mg7KGIx3PNbevbAYK9fpmSuiWhC9OoTF5RynAKB31qJBgqop6m
	 SCuon0S6OseuU+bLsJvOo768IJ/HQxvJc7YlZDykNaHUatUmZVqZIOXAu67v3ObuAT
	 rBWLOmR2jVrcZUNfXp3PDUuFNsnrSrhAU01VCRM9eytOy0S50jtKbjIClzR72op8ip
	 mPuhRlzPQoYd5RWXWJ2OcqZY547pj/GLfuH5K/0S3QqIVuYq4nWRbltLhOMkFjR/y7
	 okl4Xc8YxYOIThydVzngeXdBIGaSX3i+S0LmWZ4mLpwSITDBsfz5MYqC6w4GH/JLEU
	 +93cxjjAc5JDA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9274B37809D1;
	Tue,  7 May 2024 20:07:43 +0000 (UTC)
Message-ID: <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter
	 <daniel@ffwll.ch>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>, Andrey Konovalov
 <andrey.konovalov.ynk@gmail.com>
Date: Tue, 07 May 2024 16:07:39 -0400
In-Reply-To: <20240507183613.GB20390@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
	 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
	 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
	 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
	 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 07 mai 2024 =C3=A0 21:36 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Shorter term, we have a problem to solve, and the best option we have
> found so far is to rely on dma-buf heaps as a backend for the frame
> buffer allocatro helper in libcamera for the use case described above.
> This won't work in 100% of the cases, clearly. It's a stop-gap measure
> until we can do better.

Considering the security concerned raised on this thread with dmabuf heap
allocation not be restricted by quotas, you'd get what you want quickly wit=
h
memfd + udmabuf instead (which is accounted already).

It was raised that distro don't enable udmabuf, but as stated there by Hans=
, in
any cases distro needs to take action to make the softISP works. This
alternative is easy and does not interfere in anyway with your future plan =
or
the libcamera API. You could even have both dmabuf heap (for Raspbian) and =
the
safer memfd+udmabuf for the distro with security concerns.

And for the long term plan, we can certainly get closer by fixing that issu=
e
with accounting. This issue also applied to v4l2 io-ops, so it would be nic=
e to
find common set of helpers to fix these exporters.

regards,
Nicolas


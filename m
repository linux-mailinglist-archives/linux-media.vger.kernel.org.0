Return-Path: <linux-media+bounces-3942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1B832FBD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 21:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3417F1C23F94
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 20:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E105674C;
	Fri, 19 Jan 2024 20:27:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A433956748
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705696037; cv=none; b=nEayRgUUqkgkHjt0jhGDjNR7NSM6WAC3U3KbqWNXIeGxaaEp3+yO3rv8Fbgn8Srvts3KbsYzfOfRkHthxwjPWcjiKua9pufU/k96qQD+bAe7vzUJM3yxKwxrNLiez9h9knMTe3MuXvalJ5+Mlu2v8K3eowrHcWMEHOIqpaqjF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705696037; c=relaxed/simple;
	bh=vw9xVas+10MMlKR4nXzIQGelEWmgGnwDwJt1bAM89b8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=dirI+lCk+1m8dNSodTnpZd1lyX1mIrnAQQe4v5StaCvl9OIjJgsPKzcF6cIbckAI7+nznrq0ZVid2hOJmA4bmZxBCNQLL3h+UZHdn5f1NkZM3v6Yn9DhVcebOhvbUuxue0iMvmB6TtSecGkFKWClQlTInIckd0GhlCR7qEAPwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philippuhlig.de; spf=none smtp.mailfrom=philippuhlig.de; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philippuhlig.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=philippuhlig.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TGrkf5Dd2z9sGf
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 21:27:06 +0100 (CET)
Message-ID: <053e25e436ce45b4dc9119faabacdea00662d207.camel@philippuhlig.de>
Subject: New known working device
From: Philipp Uhlig <mail@philippuhlig.de>
To: linux-media@vger.kernel.org
Date: Fri, 19 Jan 2024 21:26:58 +0100
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Dear UVC-driver team,

I've bought and tested this new digital microscope successfully:

aa47:5111 Bresser DST-1028 Digital Microscope

Everything appears to be working. Highest quality video stream 2592x1944 @ =
20 fps looks great.
User and Camera Controls reported by v4l2-ctl can also be applied.

Please add it to the list of known working devices.

Thank you and kind regards
Philipp
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE1J2BCDQ6gOvIL/RT3FAw/NQu8MEFAmWq2xIACgkQ3FAw/NQu
8MEEdA/+Mw/bPELEenHwBSXaMjW8fgVNI0VYNj5/SRiB/I2nTerg5VLPADi19S6Z
/NabCRpa2uBnhATGjE6xa29CqPJlzaL5Csr4exwrYbYtlkAh6oOmHQksaglsRcOe
SJof3sl8Egb/LFKeso5/9juPhjxPb/pIVHt8IU7/o30YRWGMlpJceIvifRLNGXoF
JL7Vl5sSHQumFLxkEcMn6vmpeODqDwtbddA41u3Sw4K4+M8Te0EaZV7J5z9YPUmE
T9epxzq04hBianfjs8PXxPIShMpyEgm3df0ttIKUJ3CVOiBVbeiMuIPir13CUAJs
SolPNpf6V+n5/HdplylPv+qEDQVNaP21JB/EnTfEcRuYxGUo0KwuHQhMDRl6HgJM
0sZMIQIG5UKsLdtaYtUXjan4e8gzIOJe3FDfI8K5jgu3gZKEBpQbOTL1Gx6DNwSX
BXPm8+4iG97SMKYqk5h2MDM3XXp8cMyYDISvz1T0/teykRgaMqAEb4LBJsfTPf8C
F5Lrl4DOD6HDEKx2PBb0d48haiBD2IfQiks0IuE5TdalRvPe6wBU0EhKftgho9zR
gMdNB18en2ctjMgloB53oWSyMpdq2j/dXjJ07NK6g269jK4sUhKfKnjKGzReCnGQ
jkKOM/FG+8YVC/rC4864fz+dt9X7X4TRhcP4h8NHOljp7JGDkcA=3D
=3DNgNo
-----END PGP SIGNATURE-----


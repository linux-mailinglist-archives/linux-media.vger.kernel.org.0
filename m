Return-Path: <linux-media+bounces-14748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A7192B998
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 14:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8E21F2313F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 12:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D6D1591EE;
	Tue,  9 Jul 2024 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuss.ms header.i=friendscout@kuss.ms header.b="GSlqCTi4"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E8155A53
	for <linux-media@vger.kernel.org>; Tue,  9 Jul 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528572; cv=none; b=R2Sw3vbe4cPCJeVng93dcIb7Ffa2GG307vcVUrt1TbtuH3nE+cB9pL3/lwYOFwumkGbSUxsa3Ucre/v2NQZq48TiX0iMUDL2YyA2EwRB6f8LVg93kNSB+hKprqebq+KI0FJzkzbn48NxdQbb7b6rv3553+M+UK79VmPqh1wFUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528572; c=relaxed/simple;
	bh=+KUvTkoBvwVYTCqxYhmKbqzJ26ebhdnhNDmhvdxCv8c=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:Date; b=M4s+hMlQvxl/x6FVxPfVEkLv1/sZJAG4DaEhtgnDIr4sk+6OX3497KXJ+ZxiAZsh33lvnQjn5t9VIf+mP1sGxxuxYkojDXr7byn154N6J7M5683oSlEpO+3UEkXAVMUBrt9NtNLLurp5ToyWhCAws+M1/gHAtsxeWaJDv8LWwEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuss.ms; spf=pass smtp.mailfrom=kuss.ms; dkim=pass (2048-bit key) header.d=kuss.ms header.i=friendscout@kuss.ms header.b=GSlqCTi4; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuss.ms
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuss.ms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuss.ms;
	s=s29768273; t=1720528565; x=1721133365; i=friendscout@kuss.ms;
	bh=+KUvTkoBvwVYTCqxYhmKbqzJ26ebhdnhNDmhvdxCv8c=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GSlqCTi4IqprT7SIl39KeabugU8Q1y6b6bmhtSBwwOTPl3h1JWV+8iVPdJmyEMPq
	 Gearh9Krq7b593hxn5MA6WB8kzoXTgZAlHj8PN/JA8u+I58TZflg7mrjrRHESvMmj
	 ++RAo82YCeUr5S03z4zpHxEw9eXB1tN7MIpaj2R7KqzcLQXPsr0A2sK9HitH4ZHwp
	 hAcD5cTUDpY1uS8pyd2ahPN1mfC5GWWOmJEktpxZb0pLLlOgvxIg3xi+WnyXWtXMc
	 enCRlMvMuwpaXZay3EiHhkw+T2qEK+iFG/+nvbb83XqEiM9deABesjvaAOhhlL+t6
	 gTYQfSgoOxiNT5d55g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [178.251.90.190] ([178.251.90.190]) by web-mail.web.de
 (3c-app-webde-bs19.server.lan [172.19.170.19]) (via HTTP); Tue, 9 Jul 2024
 14:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-b60ffddb-ebbc-4aff-a86c-e4b2d74f3d63-1720528564959@3c-app-webde-bs19>
From: Christoph Lauer <friendscout@kuss.ms>
To: linux-media@vger.kernel.org
Subject: [BUG] media: platform: coda: camera Dometic CAM58IP causes CODA
 PIC_RUN timeout
Content-Type: text/plain; charset=UTF-8
Date: Tue, 9 Jul 2024 14:36:04 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:RW4WpPnImRCce75BNWEy5iNowSZ+szP04PLhmR9WkF9pPonaIiWuhFiQaIsY1rhK+9M5i
 5kV2y4lrnBPn5joon8OKYJ0N/l/P5ozCPzxdtA69+ufpgBHkPZ1sv02oU1PxSw51Ua/rhKlgM6bN
 xZMpMoYR7pWIl1dBvm5aJIERCZ9+ofe+i2UAYNGFdExfi4RG2go8SnaWLKl3LQtv4U+mDMxlX6BG
 UxsXwjV9oMKbBmVQ8YKk5VhFAUOhXbs4sjqpc1f+6BKBSZflhkpj4sn2o1r8c1DlvXBxO4/mil8l
 to=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hhds7HiDt+g=;M5tz0LUc4LcwF7vQUlTXVbu1wwB
 9/p15XZOaN6xx8LLdWN7OD43HO+6YhQWSV1Rvj0blL4VU3Q7GuSvEHQQTME6wLDxkKl/uD4P4
 8+TRyiG+bdat/U1pagiOn6kpO3teO+Io1KGiY8eh76ukaCfpYiLplDGkVDQCmDNMmHHoWO0Ma
 2nv/Ro2CBWxkBE9puPICbvGt0gZlEHu5Jq/7C5gYUUoxl7heVhIhf9VPQtezbXUB0+SOFi+nn
 rKY/uVdQ7fH++uT3aHf5Mm1Ul+UHy6gGp1tLSXE49X1zayFUpFLVlN00IVjU2VVdtfkxPyWhJ
 SiNJ+vM4d8+OMyVk3LvFBjuRxq2fIw0eRpVxRX1wHyMP87Qcij7XPBq/4F28FibJVoRerf0CE
 8rQf4szOwdG1KWjZJi/p8i09GoC17Al8tiCuey9bHt7gEbuUl8PyOMrURXipuMJTWydjaJAsF
 gO7upwHuSeHKqlHMvAB+Xpm9nTh2NYbxo+DzAddCwNQ5HPj1awGOVoMiJIT56otFQy7swYMPN
 0ww1hxAcAuF+fyYY5BCkKLiQp9VkumS3fzkwuNZo9x0RJTZinOAcVWZ+9JnNI0AFsmG7fI9Ql
 yv51vJ7A1iJ3OlPUqIBbsDkK1OG0M1cWaANnD9/LVyEM7ysB63uQZI6I7j60AIDX8XvSgANHc
 KfnyuRMY5pS/qYn/NTGELWxtYTncM+uF5Y7nTMe5CxjHnUqDJfBCAL96MwrJi78=

Hi,
I am working on a Phytec i=2EMX6 DL and I am trying to get the IP camera D=
ometic CAM58IP up and running on a coda-configured Phytec kernel (5=2E15=2E=
102)=2E The connection can be established, but the stream doesn=E2=80=99t p=
lay, and dmesg shows this timeout message every ~2s:

[ 1029=2E344642] coda 2040000=2Evpu: CODA PIC_RUN
=C2=A0
I can successfully play streams from other IP cameras on the mx6 device=2E
I can successfully play the Dometic stream with VLC media player or with g=
streamer on a desktop system (not using CODA)=2E
=C2=A0
I have already applied patch =E2=80=9E[PATCH] media: coda: avoid starvatio=
n on well-compressed data=E2=80=9C from Benjamin Bara for testing, the resu=
lt was the same=2E
=C2=A0
Any help would be appreciated=2E
=C2=A0
Config summary:
HW: Phytec i=2Emx6 DualLite with CODA960
Kernel: 5=2E15=2E102-phytec
Gstreamer: 1=2E20=2E7
CODA Firmware version: 3=2E1=2E1



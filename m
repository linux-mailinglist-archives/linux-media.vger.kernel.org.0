Return-Path: <linux-media+bounces-45093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCABF37DB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 739284EDA2D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF6A2E03FE;
	Mon, 20 Oct 2025 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="R4U7Al+R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA0240611
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993168; cv=none; b=SucNYjE/M/AxAIIII53xvWJ/0DkIVtpDmigj7JTfsoVv6UoOCIYxpQcZwjho3eacTON6hU4mf6edrHeBziHorLQ6JtmEzsmSo5inxFfOiiZfMuR7RyrKOgX7U/S9i1D3O84HdwMA1swx1JenBYNA+tJnzLYWNfPcB25BUyOrH3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993168; c=relaxed/simple;
	bh=8pB0QMKS36W0Fgitz8BzS3uo1jF+YxWQ0txxOlFL7fk=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=locvIWfPwYBI+xv9CiO7r15NIjCjmGZzm3BDsAi/nAjZsW8sx8DUeIHatTgk1TZWX9aFThA5TBIJdu+ye+vqvYNuW1KEPtLU2WBk11B7aXt+8ULL0kbVS1URd488NdQVnIFyzm9aaYhJwmU4fGs5+OyG5KPZwbSkJROU0EZU6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=R4U7Al+R; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtpclient.apple (unknown [46.193.65.132])
	(Authenticated sender: perenono@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPA id 0DEDB2003A4
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 22:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1760993162;
	bh=8pB0QMKS36W0Fgitz8BzS3uo1jF+YxWQ0txxOlFL7fk=;
	h=From:Subject:Date:To:From;
	b=R4U7Al+RyLNnkoS+gbxHTXlxI3ecqJRKjE4DLpB0DzEH/QTn3Rrq9NlSqXz0htdZ/
	 ewVi1g0L09XIVGKsfaVYZXgqm3mswTPdQ+EFbng7rltzwfvDxPjEjawVYRcvRZ8DnL
	 q2KKLzfhNfPD7NJLsamLjMe3eqFjayvN2zhbuJRsijhEmUTGHsvkdy9UmsUaTUMw1u
	 FhFjiOpW84OBf/v/t7JzKpcdx6JiAIRa1HU3UiisAU+LQ0drtcXGD/lMO68KdU48xG
	 J6wcNtH1ih5XYKVl40LC2wL8DTtMxcF2NQHIGpF1wpo8ACdiqpl+hvQWq8zzv2VECW
	 pvSbel4Gmmttg==
From: =?utf-8?Q?Jean-Baptiste_No=C3=ABl?= <perenono@free.fr>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_6BDE62C8-C2CB-4A25-AAF6-B626C40201EB"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: dtv-scan-tables: update for dvb-t/fr-Paris
Message-Id: <C4F80D0E-8609-444E-BED5-29718B9F76A3@free.fr>
Date: Mon, 20 Oct 2025 22:45:51 +0200
To: linux-media@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81)


--Apple-Mail=_6BDE62C8-C2CB-4A25-AAF6-B626C40201EB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello,

This is an update for Paris Eiffel Tower DVB-T transmitters at =
https://git.linuxtv.org/dtv-scan-tables.git/tree/dvb-t/fr-Paris.
Attached is the updated config scan file for Paris Eiffel Tower =
transmitters in dvbv5 format.

--Apple-Mail=_6BDE62C8-C2CB-4A25-AAF6-B626C40201EB
Content-Disposition: attachment;
	filename=fr-Paris
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="fr-Paris"
Content-Transfer-Encoding: quoted-printable

#=20en=20:=20Paris=20-=20France=20-=20various=20DVB-T=20transmitters=0A#=20=
fr=20:=20Paris=20-=20France=20-=20differents=20emetteurs=20DVB-T=20de=20=
la=20Tour=20Eiffel=0A#=20Latest=20update=20for=20the=20data=20/=20=
derniere=20mise=20a=20jour=20des=20donnees=20:=202025-10-10=0A#=0A#=20=
City=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Multiplex=20=
number=20:=20R1=20R2=20R4=20R6=20R7=20R9=20R15=0A#=20Paris=20-=20Eiffel=20=
Tower=20-=20Channel=20number=20=20=20:=2035=2025=2030=2032=2042=2024=20=
28=0A#=0A#=20Note=20:=0A#=20R8=20-=20Is=20no=20longer=20used=20since=20=
the=2005/04/2016=20-=20Channel=2058=20is=20no=20longer=20used=0A#=20R5=20=
-=20Is=20no=20longer=20used=20since=20the=2005/04/2016=20-=20Channel=20=
28=20Re-assigned=20for=20R15=0A#=20R3=20-=20Is=20no=20longer=20used=20=
since=20the=2006/06/2025=20-=20Channel=2022=20is=20no=20longer=20used=0A=
#=0A=0A#=20R1=20-=20Channel/Canal=2035=20-=20=20Groupe=20GR1=20A=20=
(France=202,=20France=204,=20franceinfo:),=20Groupe=20GR=201=20(France=20=
3-Paris=20Ile=20de=20France)=0A[CHANNEL=2035]=0A=09DELIVERY_SYSTEM=20=3D=20=
DVBT=0A=09FREQUENCY=20=3D=20586166000=0A=09BANDWIDTH_HZ=20=3D=208000000=0A=
=09CODE_RATE_HP=20=3D=203/4=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09=
MODULATION=20=3D=20QAM/64=0A=09TRANSMISSION_MODE=20=3D=208K=0A=09=
GUARD_INTERVAL=20=3D=201/8=0A=09HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=
=3D=20AUTO=0A=0A#=20R2=20-=20Channel/Canal=2025=20-=20Groupe=20NTN=20=
(BFM=20TV,=20CNEWS,=20CSTAR,=20Gulli,=20T18,=20NOVO19)=0A[CHANNEL=2025]=0A=
=09DELIVERY_SYSTEM=20=3D=20DVBT=0A=09FREQUENCY=20=3D=20506166000=0A=09=
BANDWIDTH_HZ=20=3D=208000000=0A=09CODE_RATE_HP=20=3D=203/4=0A=09=
CODE_RATE_LP=20=3D=20NONE=0A=09MODULATION=20=3D=20QAM/64=0A=09=
TRANSMISSION_MODE=20=3D=208K=0A=09GUARD_INTERVAL=20=3D=201/8=0A=09=
HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=3D=20AUTO=0A=0A#=20R4=20-=20=
Channel/Canal=2030=20-=20Groupe=20Multi4=20(M6,=20W9,=20Arte,=20France5,=20=
6ter,=20PARIS=20PREMIERE)=0A[CHANNEL=2030]=0A=09DELIVERY_SYSTEM=20=3D=20=
DVBT=0A=09FREQUENCY=20=3D=20546166000=0A=09BANDWIDTH_HZ=20=3D=208000000=0A=
=09CODE_RATE_HP=20=3D=203/4=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09=
MODULATION=20=3D=20QAM/64=0A=09TRANSMISSION_MODE=20=3D=208K=0A=09=
GUARD_INTERVAL=20=3D=201/8=0A=09HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=
=3D=20AUTO=0A=0A#=20R6=20-=20Channel/Canal=2032=20-=20Groupe=20SMR6=20=
(TF1,=20TMC,=20TFX,=20LCP,=20LCI)=0A[CHANNEL=2032]=0A=09DELIVERY_SYSTEM=20=
=3D=20DVBT=0A=09FREQUENCY=20=3D=20562166000=0A=09BANDWIDTH_HZ=20=3D=20=
8000000=0A=09CODE_RATE_HP=20=3D=203/4=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09=
MODULATION=20=3D=20QAM/64=0A=09TRANSMISSION_MODE=20=3D=208K=0A=09=
GUARD_INTERVAL=20=3D=201/8=0A=09HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=
=3D=20AUTO=0A=0A#=20R7=20-=20Channel/Canal=2042=20-=20Groupe=20MHD7=20=
(TF1=20S=C3=A9ries=20Films,=20L'Equipe=2021,=20RMC=20LIFE,=20RMC=20=
D=C3=A9couverte,=20RMC=20Story)=0A[CHANNEL=2042]=0A=09DELIVERY_SYSTEM=20=
=3D=20DVBT=0A=09FREQUENCY=20=3D=20642166000=0A=09BANDWIDTH_HZ=20=3D=20=
8000000=0A=09CODE_RATE_HP=20=3D=203/4=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09=
MODULATION=20=3D=20QAM/64=0A=09TRANSMISSION_MODE=20=3D=208K=0A=09=
GUARD_INTERVAL=20=3D=201/8=0A=09HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=
=3D=20AUTO=0A=0A#=20R9=20-=20Channel/Canal=2024=20-=20Groupe=20GR9A=20=
(France=202=20UHD,=20test=20UHD)=0A[CHANNEL=2024]=0A=09DELIVERY_SYSTEM=20=
=3D=20DVBT2=0A=09FREQUENCY=20=3D=20498166000=0A=09BANDWIDTH_HZ=20=3D=20=
8000000=0A=09CODE_RATE_HP=20=3D=203/5=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09=
MODULATION=20=3D=20QAM/256=0A=09TRANSMISSION_MODE=20=3D=2032K=0A=09=
GUARD_INTERVAL=20=3D=201/32=0A=09HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=
=3D=20AUTO=0A=0A#=20R15=20-=20Channel/Canal=2028=20-=20local=20channels=20=
only=20on=20Paris=20-=20Eiffel=20tower=20transmitter=0A#=20Group=20=
Multi-7=20(Canal=2031,=2020=20minutes=20TV,=20Le=20Figaro=20TV=20IDF)=0A=
[CHANNEL=2028]=0A=09DELIVERY_SYSTEM=20=3D=20DVBT=0A=09FREQUENCY=20=3D=20=
530166000=0A=09BANDWIDTH_HZ=20=3D=208000000=0A=09CODE_RATE_HP=20=3D=20=
2/3=0A=09CODE_RATE_LP=20=3D=20NONE=0A=09MODULATION=20=3D=20QAM/16=0A=09=
TRANSMISSION_MODE=20=3D=208K=0A=09GUARD_INTERVAL=20=3D=201/32=0A=09=
HIERARCHY=20=3D=20NONE=0A=09INVERSION=20=3D=20AUTO=0A=

--Apple-Mail=_6BDE62C8-C2CB-4A25-AAF6-B626C40201EB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Could you please ensure that this new file is committed into the =
repository https://git.linuxtv.org/dtv-scan-tables.git/ ?

I also submitted a pull request for the TvHeadEnd project but they =
don=E2=80=99t seem to update their dev-scan-tables fork quite often !
Feel free to cherry-pick my 3 commits to get a more detailed git =
history: https://github.com/tvheadend/dtv-scan-tables/pull/161

Thank you. Best regards,

Jean-Baptiste NO=C3=8BL=

--Apple-Mail=_6BDE62C8-C2CB-4A25-AAF6-B626C40201EB--


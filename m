Return-Path: <linux-media+bounces-9288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79F8A46E1
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8891C21099
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E045182A3;
	Mon, 15 Apr 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="SvLuoAot"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55451DF4D
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147879; cv=none; b=Tbc9+hLrLegmPwMcH2h8SolEN/DjndVAoHrkzQvmUyMhvEV4RW3UpP9NNWkGBBtsF1db+xGSlYULSLJcsoiejqxel82NznTKI7fpjZB+sd4skdc2wYIPs4d7TsqtoQk98I4ZYb5zatv03Phqck4vo/3e56nEW+zzz1vDrAySgz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147879; c=relaxed/simple;
	bh=gUM9ExQAtBO6bsDgewFEsOT4UM8/QfLpgXznN8HrkY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FqqCaFTsY27Ljc0fvxSLA3yqL07VPCqOrz1DQf+qraQwTQgYtzBfOzs76uxL1oKBXA0AjEzXmaqHIL17HSTTLdesqrjuWnv6eYmaIHBYOSJ1uH1uIdZeeiUwc75QsE+/m4QulsqN3neIKj2CT4Ihb6ek4BD4eF/sOjEtWT11awQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=SvLuoAot; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147871; x=1713752671; i=herdler@nurfuerspam.de;
	bh=uUjCnqYRlBf3hrygo2IF3RNJShnOVHpAU4nGZs9um20=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=SvLuoAot4gBZdOZDzLnYrMBUIj/csC5nGMAiz/88JcqtwJzbX6YrhBsDWHALBSCm
	 kN4qyyJzLMN+yZRb7rSpN3Xg5Kks/xKCk1Np527B7/KYQxEPDHelX8rOX19osNAyh
	 oLeLEBr+C2ib8Z3km0bvVl8kIxe7leYKxVUb67kK8FzXjBPWWKxtbf4Uj4RXIq655
	 4Do0PJ8GPO0Lx8/YOW9JhsLCC1kTB8sjA0PMg7lqMBEj3SYICwLBSzWR64cYvHBg5
	 ErATq3SQbvOZvBJBxjPwT9/JuTBpnBJyHjknHwiEG0hsFwBRy67rKzA88WygmoSTB
	 0NciIi8RJs2XZ/+IcA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b2d-1roltK2epp-007ysd; Mon, 15
 Apr 2024 04:24:31 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 00/10] media: ttpci: make checkpatch happy
Date: Mon, 15 Apr 2024 04:24:01 +0200
Message-Id: <20240415022411.234580-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wMcMz3YSBG2cAQNTFfEpJq6o7aX1iSNDV0z83ChIL96DbqAEwVZ
 19LBgIQaFSg19jVdsrU7WVf8GomN3AL3ZNim2FS7pH4vquFolrYwKqcLbG4XXyS3WD/aLxq
 sVmUHrpGwy88slnnfjKHxYaXwq/EmcTNmir0NER3vXhGXJRO9JI6jAIwrrFaCP6IKW/shPb
 fYezZAgBNSzypo9lY/k2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cz8HNOxbE9E=;1HnQiHOL3BhTIAhCmzn/NVocsYA
 jmIwHUMWS8vtTj6Xupx41xSnWbOztPuDo1jjpEqt2+C5CwvJKN9tiG8jdohodYLGDmx0NVy1F
 EX7foxUDeeNIlfVgFmpMEGvQhKxUKJLuXpnZcWLjtFFJyjrxCJnGCtY/n3EiZs9xtBSzcFwJN
 mV6svwu6S+wdVJtR0aCoADknZ+quBIiRU830MAZyjcpTRPgkxZrJMEnHTSB4NZqbt9zE43cAH
 fwpyBrpht61EmWowE7csZ6/c1dneZTBchlyiLY2rO9Zb2z732KLrjuFM9Lxfy5EwcH0VkY1Km
 lk4sX99YzFZzdY8KgpsJ3PH47JJI854WKN1Djr/SVabwcVAjQzUVwYRuU3zvqc0g7I7V7zj/0
 jlJu9uWyU3Ktyr+6lQQaZ+oueCBBRNFEkNFD+GpY/a2y3Vsfiukq7rAzMXAur3zF/pHaRrk7Z
 TUIJk8e3x3U6g7C61SWNttTt5yCjH8Tq/Ju2aX2ziIKzXdVdjaAWus46PCnETVMpjGbueM12R
 WAJtFMVrHUHIlpvuuuEEF1Ov6I9sphMOuPMQasa11UMjfHoM/M+NxGv+ns1SDVyJCmssPEwyD
 LE5/JIcYGgsU99jzksOJoWjIXiKbtwKrcrpsuKbcokngfY3feopumHAxXPxRMn5aTwI9d4TeB
 BCObOGSHdxNUjQcKiSvSiGXrC/+mphoUc4bmymzV50EIS+TlMaOkqpz5Kf9z/kYTSuB5apJCC
 9SiILt8HmbVVoLz0LkphXHTooFhsUrc+uUGLwRCRoFfzdT8y69h/iOyGnAx8HVZPjUMI1VFZY
 Q1awz/5RyH1HQY5DzWOjUTEZvUlaz+8wVpq21yCgHNGtY=

Hi Hans,

the patchset has been fixed like suggested, at least almost.
There are 2 little improvements the 'strict' option pointed me on.

Notable difference:
Patch 0004 and 0010 had been slightly updated, see there for details.

Regards
Stefan

Stefan Herdler (10):
  media: ttpci: checkpatch fixes: whitespace and newlines
  media: ttpci: checkpatch fixes: whitespace
  media: ttpci: checkpatch fixes: comments
  media: ttpci: checkpatch fixes: braces
  media: ttpci: checkpatch fixes: export_symbol
  media: ttpci: checkpatch fixes: assign_in_if
  media: ttpci: checkpatch fixes: trailing_statements
  media: ttpci: checkpatch fixes: constant_comparsation
  media: ttpci: checkpatch fixes: miscellaneous
  media: ttpci: checkpatch fixes: logging

 drivers/media/pci/ttpci/budget-av.c   | 573 +++++++++++++-------------
 drivers/media/pci/ttpci/budget-ci.c   | 495 +++++++++++-----------
 drivers/media/pci/ttpci/budget-core.c |  38 +-
 drivers/media/pci/ttpci/budget.c      | 173 ++++----
 drivers/media/pci/ttpci/budget.h      |  21 +-
 5 files changed, 659 insertions(+), 641 deletions(-)

=2D-
2.34.0



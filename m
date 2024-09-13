Return-Path: <linux-media+bounces-18239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB897787C
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 07:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 353402882E0
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 05:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD5E1AE038;
	Fri, 13 Sep 2024 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JWT3/Hte"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3B126C12;
	Fri, 13 Sep 2024 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206359; cv=none; b=F/UKVh2LcLsbKIKGjGSephxMKxiEgP2PWJOsIl7zLu6Bl1FhbER0QG/BcrFUveeCTrSOFvTTyS8rnI5pPqbVGY4dOJmbwRDfeoZJLDHK68wrrGYscudMTDu7X7rfqfg2p5Y4vrOWauK33VmIdmpMFOPToJH1UOL3GtYFDzrKa0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206359; c=relaxed/simple;
	bh=55W/lKuuJx2dPUGz2/cR4w+tFTwmDSlLpXwqxY0XTRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVIY3gNDk1j72eAB4Aqc9tsb1G9edVoBkvZi5vcN/MyyzaT/Qwyn3xGwnu+BVb+XL358Tlna5Xs4kWz8gwQEuu9KhsLuKmdkNpfDqlvWNlq2+JxU3tw7P9ZQ1LD9IbPO+O1kZAVtodg67BA1f4veoHGt5Ix99HhWAWlTAgaMN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JWT3/Hte; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jj1u031473;
	Fri, 13 Sep 2024 00:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726206345;
	bh=/9TbgTK+q5BwFXk7kzUWo913SP9Kg8qdPa192T9yDHA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JWT3/HteAgi23rsMTDrjkyjX8M+tLI3GrTwCscFYGo7KjDIMpbjOjgRmsGe6hMXAE
	 zNSlbdqilROZpDTtgOCFOToS9wlvPCkbkDPA+ygGhc0j05eMX8d3p11C7t7KuZyhkL
	 LpwjqEhC4mo0AnTYfa2BxHhYUI7l9N0abnwX+BuM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48D5jj0C021493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2024 00:45:45 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 00:45:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 00:45:45 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jiOZ022746;
	Fri, 13 Sep 2024 00:45:44 -0500
From: Jai Luthra <j-luthra@ti.com>
To: Jai Luthra <jai.luthra@linux.dev>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Jai Luthra <j-luthra@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [PATCH 1/2] MAINTAINERS: mailmap: update Jai Luthra's email address
Date: Fri, 13 Sep 2024 11:15:00 +0530
Message-ID: <20240913-maintainer_email-v1-1-10c574bc1e7f@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913-maintainer_email-v1-0-10c574bc1e7f@ti.com>
References: <20240913-maintainer_email-v1-0-10c574bc1e7f@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

I will no longer be an employee of TI, so update my email in the=0D
MAINTAINERS file and .mailmap.=0D
=0D
Signed-off-by: Jai Luthra <j-luthra@ti.com>=0D
---=0D
 .mailmap    | 1 +=0D
 MAINTAINERS | 2 +-=0D
 2 files changed, 2 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/.mailmap b/.mailmap=0D
index e51d76df75c2..189077135aa8 100644=0D
--- a/.mailmap=0D
+++ b/.mailmap=0D
@@ -257,6 +257,7 @@ Jack Pham <quic_jackp@quicinc.com> <jackp@codeaurora.or=
g>=0D
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@google.com>=0D
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk.kim@samsung.com>=0D
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@motorola.com>=0D
+Jai Luthra <jai.luthra@linux.dev> <j-luthra@ti.com>=0D
 Jakub Kicinski <kuba@kernel.org> <jakub.kicinski@netronome.com>=0D
 James Bottomley <jejb@mulgrave.(none)>=0D
 James Bottomley <jejb@titanic.il.steeleye.com>=0D
diff --git a/MAINTAINERS b/MAINTAINERS=0D
index 42decde38320..abd8e08304a6 100644=0D
--- a/MAINTAINERS=0D
+++ b/MAINTAINERS=0D
@@ -22919,7 +22919,7 @@ F:	Documentation/devicetree/bindings/net/ti,icss*.y=
aml=0D
 F:	drivers/net/ethernet/ti/icssg/*=0D
 =0D
 TI J721E CSI2RX DRIVER=0D
-M:	Jai Luthra <j-luthra@ti.com>=0D
+M:	Jai Luthra <jai.luthra@linux.dev>=0D
 L:	linux-media@vger.kernel.org=0D
 S:	Maintained=0D
 F:	Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml=0D
=0D
-- =0D
2.43.0=0D
=0D


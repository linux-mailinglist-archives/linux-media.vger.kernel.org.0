Return-Path: <linux-media+bounces-18240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F1977880
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 07:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A3F1C24EBD
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 05:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356801BB68C;
	Fri, 13 Sep 2024 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YiZRILjl"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A123126C12;
	Fri, 13 Sep 2024 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206369; cv=none; b=cJEpXO/vjDTAnonUV70LzWh8EqGlqZD3wRwseE1N0Rn7yn0Yk5H7hU6nqgG4Qip2QF1UQwg6QNtRAk3MGdjPHL6UuCXl3tgJcUG1ghg9ve7WmQ+WLGbZIROhRqFPS0CjAZiwQpmt3e3uMiJTi7S3DIfsGw1wHfJ5U9l5/h0H/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206369; c=relaxed/simple;
	bh=eV/T8sUcUxx7POf9QK3Dl6id7FddeoCjxhsSBXgpcd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktzKuoUU84Q3NI2qphkcTiDuckn2RM1b1iLJB/V9xxLQlIOxPkKBn494WDsH5jmmIPdCg7wUKSw13ay57HAupNa9ja4QYflg3PBkYlmKoJEoqDT2qHsoTvnVOC/TPEm70/8Dg4CYYJZ911caCqNuO8kwSk4vfQZwjcWmV/Tj2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YiZRILjl; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jlpC022020;
	Fri, 13 Sep 2024 00:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726206347;
	bh=v97XVJ9tpllW38oQNLyJjoB5iGyEwtCuwOkT+p4KMpg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YiZRILjlVWLHNYK1Jwk0qzw76HECFE/CiWvkrObknM0g5t1n01T4b6fHK4aUN2VpN
	 H4/rWgczzE0vMJs5Et8jLfVTwOZWFU4hK/s5gzHhd8otgWmguQzPERr0SbFFuRqvzR
	 vAZflIUEw/W2rykgGisQB/dEVMvP3coJvHpsAjJY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jlg5042131;
	Fri, 13 Sep 2024 00:45:47 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 00:45:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 00:45:47 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jkVI037265;
	Fri, 13 Sep 2024 00:45:46 -0500
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
Subject: [PATCH 2/2] dt-bindings: media: ti,j721e-csi2rx-shim: Update maintainer email
Date: Fri, 13 Sep 2024 11:15:01 +0530
Message-ID: <20240913-maintainer_email-v1-2-10c574bc1e7f@ti.com>
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

I will no longer be an employee of TI, so update my email in maintainer=0D
list.=0D
=0D
Signed-off-by: Jai Luthra <j-luthra@ti.com>=0D
---=0D
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.y=
aml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml=0D
index f762fdc05e4d..b9f033f2f3ce 100644=0D
--- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml=0D
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml=0D
@@ -13,7 +13,7 @@ description: |=0D
   CSI_RX_IF section.=0D
 =0D
 maintainers:=0D
-  - Jai Luthra <j-luthra@ti.com>=0D
+  - Jai Luthra <jai.luthra@linux.dev>=0D
 =0D
 properties:=0D
   compatible:=0D
=0D
-- =0D
2.43.0=0D
=0D


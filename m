Return-Path: <linux-media+bounces-18238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CD977878
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 07:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961382881F0
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 05:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA1D187349;
	Fri, 13 Sep 2024 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vc6HI0oO"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A1323D;
	Fri, 13 Sep 2024 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206358; cv=none; b=bolpEluMgKmJbkxoeJ4CCvMByIfCQN5+q/o88S70fIQFZRynF2lyIT7wnzh/u5zDeMsUGqgs4VZM1WvxnNXSVOKGweNtOePauiyiozXsBqU6mfUjvL6DpQwaznVAG+eT3zrns3ZbJmiw6OGixCGq3kW4Tko1vPsSXf267jXkfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206358; c=relaxed/simple;
	bh=j/822kzXcyIG5H7tPbl8l2orDpVb112DQq7779ZYxac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVVrtufwL5l62e+sxUPo7Q8ogYbqCBTG+z3NRSCK+VWy/JaktlhZWUWyFwZY6nfhRIGzMJYEASo/GjPNQEw+R4xVYqgmeS2q0BW7I6MG0M4+VDx4tWGzzUmm+1lmOlUOd//j/koI3NpNGboa0795RP/mO7rLj8KKxHeopel+oNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vc6HI0oO; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jgpW031454;
	Fri, 13 Sep 2024 00:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726206342;
	bh=OG+Jm9i+45wPVOh6b0SXKwHuKe2bzE0DCmffsR29r9w=;
	h=From:To:CC:Subject:Date;
	b=Vc6HI0oOv/I5Kjl09AMgBLxXbCzloaMYPhf4eHgmuVrccZSaq6P1qd7hiq5cLNOTv
	 TqutLC+J8goSKw0SPnPh3LR2CR+5VuXm5TZolswdX29bydpEOtKcizD0OA3sCQhBCt
	 vfnILScb+Wqqn3Q6cPC+nwrBh2QaFbA0mfypw828=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jgZu042107;
	Fri, 13 Sep 2024 00:45:42 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 00:45:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 00:45:42 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D5jfgU037153;
	Fri, 13 Sep 2024 00:45:41 -0500
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
Subject: [PATCH 0/2] MAINTAINERS, .mailmap, bindings: Update Jai Luthra's email address
Date: Fri, 13 Sep 2024 11:14:59 +0530
Message-ID: <20240913-maintainer_email-v1-0-10c574bc1e7f@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

I will no longer have access to my TI email address, so update it to my
linux.dev address.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Jai Luthra (2):
      MAINTAINERS: mailmap: update Jai Luthra's email address
      dt-bindings: media: ti,j721e-csi2rx-shim: Update maintainer email

 .mailmap                                                          | 1 +
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml | 2 +-
 MAINTAINERS                                                       | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240913-maintainer_email-bb4355123542

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>



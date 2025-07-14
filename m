Return-Path: <linux-media+bounces-37714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8079B048FC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 652AE7AFC7B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A086B26FA6C;
	Mon, 14 Jul 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S700urC9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941326A0DD;
	Mon, 14 Jul 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526979; cv=none; b=P1egTLKlQbJfNKnNipCpR1f8DT2HvxxZcJc79RiOUBEzNYWULrvVgLMchWWteeWaB2Rsxh1OTr9JSf9riszxElf/66CQgu9P/O7szjSbRLloirUZ0BMEDjAzjcYwaOiUGydwbfw79mtENTWuYWReoNBrs+K+1aJxxT1FCaF3f80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526979; c=relaxed/simple;
	bh=LAt2EvqHfIqE31o3hgH7R6xohJiM3uH+mxMo2pudoXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTERp3Oz8LaxjrcTbiQyLfnJ4AlNRnZlLpb3i8Vrt632SMkL61CnSwIIscuXEGbfmAt2gcyKT2iGrwopnzf2vO5dbW3S5UCgzqNOG1Xs7h9acdaylGaCHBDPMIBuo+acyEQc9fgI5HMNVlNacTVOcPI2VnRTI5Cqza8SBqorZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S700urC9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d95b08634fso306775985a.2;
        Mon, 14 Jul 2025 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752526976; x=1753131776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7/bwewOdTejL0cRd/XuOzhnIZCbnLf0kg7kCun9SK0=;
        b=S700urC99I1kLC8REuhl5h5iXeEkz2RTnznoajEB7TnlRQ8xiuoRBN7X+Ig2b5lSZb
         EF301AgRnw42aCXdEvdK0tfn1QZlzVxSnF8l3cqiq6jXtvQCCWN4QW3OM7BFcaBSr4z8
         P675XOtl+OlDvRhYwqzlI3czNJ9GT0NddDg+ZwnBWhKpj3amUWNMzRVHdEznnTJ8+6vT
         mWZ46XoJj5EG3F1LAT/H0MX7NQR5ZsD89KphB7rPYTOByuQy4r1kRQS8EHsdBFk1TO5H
         7K7qMktEjkRelwt+h2TNne2fkmoE+8lZ/iRGK4l1sfDLbJB2yadNpNRgi/am+PmDgvCc
         M8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526976; x=1753131776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7/bwewOdTejL0cRd/XuOzhnIZCbnLf0kg7kCun9SK0=;
        b=YdQV+RRqsnqtOcdx5bUuqIwxEaa9mAR+yHO4hzV9TJTHD68228yGKXnhwwn7LZ0Iwt
         06VnKh69/Sbtdrhgm1k/dBwSjoH30GcWsEd3Wnm20GJV10JOmITFBh7Px8l8vKOv1Eh/
         cR0jt26Hj7wWvKTS/J7LjRhLe/8FjEVxM0EX1N28DGseStfoEHLGK4Ol2asiA2VFTjvE
         c9GYMV/mNmMHxjqHqhR3/eWvERDsI07F3qA4n2SK9BIhWNhN3bO1PlBR4XluoDy01If6
         uJyy4qAY0S2ICa8wm9HmvfX5f9E6KtJKOGwnqY+6xi7X2+a98AdNHeiRcnTXdIOiIZ9z
         gKCw==
X-Forwarded-Encrypted: i=1; AJvYcCUyigMLDsgH5clu4tOkU+yHDOyP22J9o6IK3iFiQBpyF3rT+kOgKAYYRRic6Ovm9/KXkE7W3i1otjF4@vger.kernel.org, AJvYcCWCNLO6K5N0p8vFVIvMQvxs5BwHTUvAoiwKFYNig4yA3efQvtsUGeIK/l68PAKOejiIpo/LBHa8MYn8HNnljw==@vger.kernel.org, AJvYcCX/XYobu+ASVmctpwlLvFDuIPD44BnkZiCA65hzz+sZ6rwKswdUrSgRq55P4TcfSwfUj3plR3jDWU7YAU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnLVED0ZC9AtnHjPJOpmaEyGSThad52hb4rRyyw9XHxIh1vhh
	kh2Vde2f42TqcXIz1OAga0yzY5A/Srle3phXWDppmuieBKzjhdXId5Zt
X-Gm-Gg: ASbGncsEu1hNCmMwJIXcOp9ebj6NQeHp8DxTZehhpFxmLdKUZWIK34Sm/wfMP7DFwSL
	DBqocHtUR/aWBPziBWfdM+E6jTXmML4ZmCYj7gC1IQLVo/XRKRduEVpulNAwvXT1K8xCoNVghdS
	3+WLgDPXsedPbFSIyXbRvb4ioVoBPiuODI/wVTdwN2BAekxT7RL1wE7PNsU1qG2jed45lZVzPYR
	IzInTZgBMb0cTD0KiwoYaXzZjE2bnIImh3O3mlMvZ1jL9xXlkad0WQjQKzleA51CZ1DePjUVJEM
	7pVfgQ3gShay+wk0gekmdwrqfGHIaTicAMNB6QNlAepe44nJy/YFsHp/nI5Wu+i68VIwh6JSqgJ
	MhuB3OCH/PQ==
X-Google-Smtp-Source: AGHT+IFl4XhdtSnghgnemZ/KstKk79fF/ueqvSFI3RebSVOwErb1tfUQkoP7sb3kCtVDfKUTFXBeiQ==
X-Received: by 2002:a05:620a:6409:b0:7e0:d294:bcb2 with SMTP id af79cd13be357-7e0d294c259mr1433173385a.55.1752526976175;
        Mon, 14 Jul 2025 14:02:56 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e1ddbde4bfsm228149985a.67.2025.07.14.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:02:55 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm670: remove camss endpoint nodes
Date: Mon, 14 Jul 2025 17:02:31 -0400
Message-ID: <20250714210227.714841-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to add these by default for all of SDM670. Originally,
they were added so there could be a label for each port. This is
unnecessary if the endpoints are all added in a fixup to the camss node.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c33f3de779f6..c275089237e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1768,26 +1768,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
 				port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
 				port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.50.1



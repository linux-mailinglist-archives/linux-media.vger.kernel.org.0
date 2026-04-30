Return-Path: <linux-media+bounces-60106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOAdKi2c82kx5QEAu9opvQ
	(envelope-from <linux-media+bounces-60106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:15:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E44A6BF2
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFFEB3007AF3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179E12C236B;
	Thu, 30 Apr 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJBn0IzE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286347A0BC
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572559; cv=none; b=F8HXdS/uhYSzjqXSc9Pp/qKTqf53p+pjxYsnul/umrXt1dEgzovKjEGuuGP+1wHo0X82d7TW1v6YlUC/neYWkkVm/2lX9p/J1I11Nsc6RBstoDbZe1E7UE7qsEpuMPCuVduNEdxViM9mt9MXrwuCDXD9AnO1oOM8OoSREx9KrT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572559; c=relaxed/simple;
	bh=JAhrZ/4Mn+RhFswy5xhoyabVuyMKqw6bv0r4qG4kack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4s/HMKt18zoSPEx68aQ+MimRDDYIY+XGpbIhQuQMiPToAt+ieRJOp54kRiY0sf+UTMjeog1+vHTy2q/s6Ribbd3/ZlRe2lbxK2rB0bkc75rbUK+fRf96H+IeL8TySyZ7Xt+1TBfZC8TxGbwvREOIOj2ZtlJQ4dA3kDr2q2DXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJBn0IzE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb5c9ba82bso184580985a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572556; x=1778177356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=HJBn0IzEZHd9cdIcNCtdmUH6yRRUqj1C1Nj8mVLYsL80g2Oo9GMuRWxmt6TvY83J5c
         z4gmu60kEtGn9NA5zugAeVS2vz8v3UYLxM2laM0kud61QtaVuqs37hiDkAjxxTUk7j9d
         s+1w5ZPHwuIgGwrNcpEc1/C+bTxYttThXKXTir9hWCYemYDJU8jsJcMdn+85WNhleaWY
         h1Sgpg9q+Wn2SHecxWlnm8VecpIMF8Le7zST8Ezniu34ofMIsRZw2bz8jpT6loXiV7fM
         2tOmk+H/7n5LtUUr3yublvdlI/0wWjvO8Uwy177MjbYSXeki1QLsS/YqB/pXPyv6bquE
         9+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572556; x=1778177356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=SmzU+bJpktHE1OLOlir9p9PFKKUHbRhutJK9X92Glhk9g5BTcj41ESx/aHdPpbQglO
         kYL8PYIFdd39tfK5oQ23A5obbSziHrDPWjmheaO735GtsBvTFG1YdY4rwG3iGOYirTI3
         ci9HlZ/gZvYQfSXYPzxpb0IBu8iK72whmtxquDbbyNeEBSJMHaiHpNmoiJ+q5fqQpUn+
         bjtKiXtyb0mEFEoKKZSvvGZ8/er+wFBtlZoSRjn/u6NO9gpYVaiRq625eX3NH5auUHOK
         yqNRn0Invc7cPRhkEIJeeGtOyN4hawk82N1lKSj7LVasgOieg0Vi4r/3vaDlgcUN4CMz
         datg==
X-Forwarded-Encrypted: i=1; AFNElJ+f0g3OxzaxjSmakxTnp1hQYEwFg6GDT0HfJK959tI+aLIxFrB2s+rBtLSHJeNLFQ5Xp1R6D7LxnCroNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxk/K8qvpbdo6Vs58Rl09mdzISY1sBvkwADAz85sVdPFe3y1Mt
	3V/WXLtpe3cEw52n4f6IZHh2ilSKV/gOcccRbfVa8r3qSQB5jy7EhjpT
X-Gm-Gg: AeBDieuasIh5mquq6DiQHE56+1hYiukriKzoAKHHZGA/tjQLsTorAlcSgBnYEyrLlp6
	nW07giN7ikaii8nFujn4rXt3hGgtPqddvGWvEYwN8GuErKeL4gCc95JZNJyFt1jt9tq8GP2lenv
	dAxTE4IiAHhodlJymaKppbqGeYcMRM7uuXhwAOerTZD8zzMLLUwOtftNqFWv7qLrpFhYTV06zIE
	f61tbnWuq/DVNuqyFd5FjFSGChLK/CtDRr7fmJBrHDK1b3UnX3SUt0PIMp5WgnqvSYGnERvTZZS
	GOk+Y81xQmpTxJIJhDresZzlU5BkuuN3MjyAmZ6O++u5VcNcrr92w2HhwCotAM3xfpgoJGBbKX7
	Mgkq/DyvA04fHJ8i15vHYaEn3LEpwLzlJasi1W9R0JSmiDB9gZkykof3o8gQ/Npus6p8u8SuJFX
	xTvSoVQfGw+qTAaTi9l8CmAx59UYlB91FxUcz6X+bu0133La68c0yOkk/0OPg7J7+mNK2/RBuyP
	hv7UrD+5CRFj7D4Nfyyd8o7TQ==
X-Received: by 2002:a05:620a:bc7:b0:8e8:93a2:217e with SMTP id af79cd13be357-8fa889439c1mr609409685a.34.1777572555920;
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb3e2b668sm31637385a.35.2026.04.30.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Thu, 30 Apr 2026 14:09:59 -0400
Message-ID: <20260430181001.9256-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 858E44A6BF2
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.843];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email,linaro.org:email,0.0.0.2:email]
X-Spam: Yes

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c195c79c1c85..1613c66f92b3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1787,28 +1787,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.54.0



Return-Path: <linux-media+bounces-32401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F677AB5707
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E4A97AB5D7
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0304C2BE7AE;
	Tue, 13 May 2025 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fA0/DqK1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D972BDC1B
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146255; cv=none; b=E7xKjnJ1JeQ1GQqd05NtdFUnHyxSccD2I4eFCTQiq55eXcpTRXdq6q63KdpB9FgCr0bCEYtm20QkinjzLiTxsR5sQQJwnEqoGdJNFgAVtZ1Tb2dUwTFchxYxcdumeUxvT4IIxLfR9EpDngAUjLAjYhNpBbscE1bp+gLQCUmUd7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146255; c=relaxed/simple;
	bh=XdEO4KmhdzkmFgTppxOTLqYmKKiZ4V91Zop709Tv7QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqtfK0ObjiWNTZXEJFL4M5jQ+bQEagk0uSF8jVuf99aN3kU/EkvCCC0ek/sDvZPSMr0cs511pnBjxY8QLsgpmJMcAOrlrJWk3yezqr5J2NRHCj864TtxQ2+cva+jEcc4+c8h5ohrYHcOG16zoHczCKCG8C5WF3cb6j5JPkj7F8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fA0/DqK1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d72d40343so1292680e87.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146252; x=1747751052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkvIXboeSQ7DpFMEdb2LOpzhdD+Ul3bkMffg79IGGvk=;
        b=fA0/DqK1u1AHapDtBP7DbQ1EE7NbFRf5SZIFkfVDBavvYxzDxcFJSJBCR11orhq/LQ
         RivDUbg5JZJCZOhdRRY/rx94p/6tw93fI6SjJqE3ELjv6qmKP5e6yRAiabjVl2AnIfSa
         LhXjQ7X9DV9j2Q0liUibRkfqEtzGqYCnHs1Kz+3c0jqN3yx711uJXol1mQwN9iF+/VSc
         MmsC9G4NsNmxApGYRL6WOpllJLPudkrzi/t25K/dISF3/aveuCp9L58uxp+vOzu1FcBC
         lM07mqOHSojQALWDsw5F6THJcZt7advAgdzAf5HTeVTwU8yav51TZVzwWNz9TsxPwLOD
         fUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146252; x=1747751052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkvIXboeSQ7DpFMEdb2LOpzhdD+Ul3bkMffg79IGGvk=;
        b=ObD8QgcTGJFAH5Y2OjoYYVjzZjkEzh4s02dpEfwx1LWC71TKCT16OiKRdBaUeaWblW
         6xuNybcHjnLusUwyc2BDE4BlKexa5U2ryCooYsELf93jzoclMpLAjthTNhX2aUvVqyrD
         6v0fyj9vLBJt/I/VU4h2x9wFJN6sh9TPp2e0O7Rd8tiV+sgVQNhwyn0rZXecD9KUWwGD
         DjjkaFXl3fJSAQlAcd5BmTWYM0pSyIG5tLXjYdzdE7zJRFROajMphge7QS0M4/enfm2K
         XLYSiWrJVSHFf6ZwU32Sm/eteZVlKJmwU17weThkUEP4yq/k7sBIABru2lC3yYMhkoYT
         DyzQ==
X-Gm-Message-State: AOJu0Yw8UOjdIr8EgXM5CcilkkosUepqrRarNyr+8SjJjwb8XYvtWVGJ
	uqexGtUjOzko9hV/83Wuc2zI6EP5oVIqGrvbj8Xc0SwyjjSIMSSet6OkyORdpy8gwqcORI+iyyu
	L
X-Gm-Gg: ASbGncsqGigME+Kf/3ojQXxicIEYbdIqNBOMeeeTwAwti2JsaU8eDoMU0kJp6oBvyBJ
	LuN3MGjR7dK0gVZb+1a7Hj+pTjkUQ0jXntn5m/KBsHxBW8UZSUapLk+v7OVGmrlfmdhtu3eUclw
	8OTu9toPZpX8oWuZ1l8qa1waLGOAPFlgjwhRgS7jEJQr/Ki0938SHK2aoV7DjSVFOAbgSj+CiLO
	QQ7M7aeQK/wlorAtsu+Vl0wLeZjgIA31hWkg6EmC9vwRIOhMjnCwwTkceCSOrSWu+Czm648N+j9
	8esGIGXRK0d2Cl7IeZJK+BpE8WskGVPEXTgHkWhELd5jT+EEB21ga+67hMMxDsDnMgwhl9h55Uq
	HAEDsDO7ZS+ljcJc8hPe0hQnIOp7pZQ/bin7iQteAcIYpaGacU2E=
X-Google-Smtp-Source: AGHT+IGQvf2B9ZgZKrTjzA36UsxZkfwbIxpb/CDy+kO+0v3DXVBuJa/bdlFuqAoJspo3OGr97iZJ5A==
X-Received: by 2002:a05:6512:3d28:b0:54c:a7c:cbda with SMTP id 2adb3069b0e04-54fc67d30e8mr2165049e87.15.1747146251725;
        Tue, 13 May 2025 07:24:11 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:11 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/9] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Tue, 13 May 2025 17:23:52 +0300
Message-ID: <20250513142353.2572563-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One more code simplification makes parsing of remote endpoints easy.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d4745fb21152..0d05f52a6e92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3038,18 +3038,9 @@ static int camss_parse_ports(struct camss *camss)
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
-		struct fwnode_handle *remote;
 
-		remote = fwnode_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_err(dev, "Cannot get remote parent\n");
-			ret = -EINVAL;
-			goto err_cleanup;
-		}
-
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
-					       struct camss_async_subdev);
-		fwnode_handle_put(remote);
+		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+						struct camss_async_subdev);
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.45.2



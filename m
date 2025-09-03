Return-Path: <linux-media+bounces-41620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F8B41150
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E05D1A8824E
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF9E1A4F12;
	Wed,  3 Sep 2025 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YIJDUWiy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAA1891A9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858997; cv=none; b=CUHWHGo/IFJwWVrWV53e5NfiW/QQdkLwDVaB4e8k1DbScZXS+g2AmWwplBdycJMzJQcaAgk2Nq5M8van9qY3IxpxbTpi8NuWfHKzCbe4Tjz5wyBOG6syGVo/YhGIjk2fYwFqx67Cl9K/ChiRNmdcziFhjeh86sHJ9xwFkk9U7v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858997; c=relaxed/simple;
	bh=HXpgPu/a2Jt75gUXVdVQWC0VO5DmFfrSNs8BUD7mYzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukn48PNFbMfefvjlqkD4MZFv4JtxpNphajW+8KOCHy+YAvrC/NVXmxQVe+/J0V7wYDyGrYIufkdWjdsGz9isfLYpyzzACAFxumqrX0syvLRpwGhy3XRycGSSQmo+Pfr4Q63TrEXuVIQHhdpdBX6Q7/d3u3DWOfShhkAaFI4+WGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YIJDUWiy; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55fc2236ce0so197268e87.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858992; x=1757463792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xKoUT4rPMoDqHpwaPvfJeO96eIskSMd6qu4FEjIHTY=;
        b=YIJDUWiyY7U9gQqUC4pM1pthCjjHitybKnfUvzN4ScYktR3fAtHO+TM6xcNMpu9OuC
         TdLw5MoCKTHKV4SmKoifjuzgVXDK+v7xfOFzgGYbf04clBGtiozDYWuXb4l73O4CtVgI
         R+MkzsaRwJb/yAUg5A55ysPIO/nx5RNiaeXRhwFr6lIo5sW7bwg8x3ipax6NLBfa7G2I
         HMhk2DoK5FX1hpeC6CrflAd9QNK1fU1VoXFt4aqbhUyECdsaoGgXVH2XOaCAKdsCs4Ef
         kTdZDXIkRfBpupqcb7zEFKhRncRaREU8eGAr0bnI5qVvIoT2R3NM89UGykH1Hp5yqLAk
         xKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858992; x=1757463792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xKoUT4rPMoDqHpwaPvfJeO96eIskSMd6qu4FEjIHTY=;
        b=dgZFV0iFjGcfUKcrQ1zX7D5+w8iI9adlIwU/JSXSqvXccLx4L4WZ0Hi/JbZC7S+62n
         xDa7ANrKlOn0ebZ+pZZPYOBi7R4b5y5tRkaU153mCtYj8Ar5CTyA4v91IrmnQLQro3XS
         p+lAEr2Essd8UgPOd134kc8SRux5YbsytVvi5sp2AIbqdYAYNAaT6DMrV+XfpPIu5W4v
         KRr6wZl0yx8kH90gtD4v1HQihyOYQGn7+Xr+TQBihoz6RECaL5kSAYADdmSKEeiNT9gN
         ukJncMl9ikUlqHlBGXgKSXBkB//PhOdipP6OKttKyJj2jNtze078X7kr/PbETAc1/i1e
         Uarw==
X-Forwarded-Encrypted: i=1; AJvYcCVbwA0KbtPhA27uCmQxmpPVv0Bckmr1diwx2VH96i3oF9GAZPIX3fgtu+w9RJN/InAYVxC51ac2oA4oYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykp9ZVKqi36auk0+29BFPDR+t4LSWJNFp/d5CKbZwgJbgpn3PD
	AF50qArg3MrTErO2IGzQ7QJcQCfVu5rOJKkpv+TPYrYDXOla9Ldx0/PZUzB62xwNXrM=
X-Gm-Gg: ASbGncuBBlTi7K3rVV9V2bvPeENOPriPZvxVwh8I7SSQnEnl4E10Q8hTEYylBV3skvI
	xOcvr1smATOTqUr7P8BKQTdZhrwTbH/P53jG/IN202rqMSXjfyBaT1kqvNbxNtB/vbJx4LnHHNo
	GA+sF88/8QkL08s4fkLpNpqQaa0Szd1wiBCRxmDEl/I+7XsO62t+2o9AnJ4f3l48u+PD4NpyX6z
	OM5wA8VCeHchhcGp5OHn/sGKxn7PZvh5qpl2p9Im+Me1eKmZOGwVOQ6wBoSa/dQTi4+2/TvbHys
	dYYkM3kYQXweZtZfygDNgyWABqgRk04doexe/J2oGe1YTbYKEL/TGr+57WPFq0CkCMZ6bFtTyQs
	RZ8eVX+fOyk6rjRzC765ctVwAD8fHF1aBXswglGRP8L4aGPBN2htcJUhYOVJ1jJRJ24mfE+g=
X-Google-Smtp-Source: AGHT+IFhSByOxqvqV01hLV3SBNaE/x4C8qcHC9XYIwvmLFzIJ1LeItyUy+Z9LdwhrZdKL+aH+tXfog==
X-Received: by 2002:a19:641d:0:b0:55f:7243:ade1 with SMTP id 2adb3069b0e04-55f7243b04dmr1344569e87.2.1756858991811;
        Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/5] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Wed,  3 Sep 2025 03:22:55 +0300
Message-ID: <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another code simplification makes parsing of remote endpoints easy.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be1c62d27e2b..4909dbdef1ea 100644
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
+						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.49.0



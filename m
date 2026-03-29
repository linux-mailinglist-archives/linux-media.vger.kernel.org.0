Return-Path: <linux-media+bounces-57491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJgRLlTFyGnBqQUAu9opvQ
	(envelope-from <linux-media+bounces-57491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FA350EE1
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7435830238E8
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DCD2C027A;
	Sun, 29 Mar 2026 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxmZBrza"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C042E4502F
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765375; cv=none; b=JdYOkRChkROywoZxjqbtb9vk9zoCwEB+wc8uvoc07JGrqwOWMuaSMDIif9h5hBoHvgIOHFfTpgkTxrxrKFC8wB0N6NVk92kZGKKYg2U8Gbp7FapmcozEutKKkfA1bwzI+Ov3GKjkxJIjshtHaZQMYMIFe/KI2k4on+7UxWlbbXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765375; c=relaxed/simple;
	bh=nZ9iNNLIBbB0DNymhq8u3hdSEPwUBris9T08vDyL8sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APCHMrBo+zqh3zQ8xgO4UsxRcLfaNM4DckP40CLxi63isfh1wP/W1MbQt6/XimlvfiU1jpkm8My4N2yy3WV1mm8OLZKKJTTAIYS7H0JOj3aQK6zl/D6bQ5/D8KckTqvOBsY9cnGlz14tiD69ROQzg99dXfVJrYyLIv0B4n5cEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxmZBrza; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so974228241.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765373; x=1775370173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=oxmZBrza4hZ0LM01jGYJJztjetxytJibSWGvYpsmmhX4YLQuThNZ/IQvsEgraoKE/w
         YXKBMi2IUKdiah9tMnN2DhZMN9rlLs2ZpJC1crWvM8cphvK6nRDlEQophDJ4b115HgDy
         itgtAXgVqVDmYohyzqei3N2fFPUT4VsggVYMlB9+gfNVlFbtySjWyzs3It1FLclyJ2K4
         Q2XukL66UT7VDpE4eYqIafQ6DzjuNRKeyDrvDvosGw5YAvn19XT9tzpkmTcHe9ilEsOA
         2igrvXJFuXpjTCcFqFrnEzn5+2QQvDxVsmnvXHCQVZsHlsWQoFoUYsgG80hrhYw1mkeZ
         H9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765373; x=1775370173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=OaTcbvMdHJvgcdsxOLIYTp9BhvLish6XJ/UwlzkeN+6iRd3ktt7y2o9NmGvTqJ/L7n
         3RSOxLu7d1Zs66Dae3JRcxHur7ykjMUbYH/lOAdGEP5KU8fFQ6P7W6pp31YzwP48hWVA
         MuAzZvdk0AgJClCLw5cVhuSAJl2bUy8AFfVPC4h2ioo52Tk+NAuO685Ffc3rTC/kO1QP
         mtvQmaeUUk32bbf2SrYOxFgXmlUouc3psHag0ztn34nR5bqOJrM4efFZaSI2QUdmC7yg
         tysCyMmrtXHHIXw/ruUNcsjAu03Ld1AT9ki9paOmDbwxqKaWolPI5BMi019Ea3brr8K4
         GN7w==
X-Forwarded-Encrypted: i=1; AJvYcCX4iQ/a3r9ZYpL9434Hh/7d3mo1FBz2CJOz9lBFCOkOwbmcNLix51LkEQhN7Nkw4EELqlhTaRfuuw8Iqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJoldI1PdkUaib/hroL3K021+eI5c+nmi6GToMB63vv7NzHqG
	QRFzd+HFE+oaIBK+fz+IZHHfN4oZlQI/hVakS1Z8+1RURS8qcZZOf9nn
X-Gm-Gg: ATEYQzzxECyk/GQ0QALPi/GP3UPQeX2qhfnGjwsy3ofe1cjEFP7Cvsy6eHTKJEVEVES
	d0pXUrFMDSTVMEmfvwXFlxW8wSTzWYzncJ4hgYkuCg+TsCFF+DSjB4AyL9aAZAhNAFi4mjh3ZMt
	ZNiWlyk8M86X1ztABnEovkxz4lVJmCIsVQ3RNEIRoyPGrXRMt8GUShdjta2uOKWDXFOoObxqhoK
	kBTiwM9jLRQCxAlYDSCmmKEQfhShodN00spNtHctqHtVD8tqFCOtxlaE18LUFp0k3AdiROJ8wh2
	eMxaeoRlOcGMbzbv+nMXMPyDe8kaBXlrTSuL9nVR9PLkNHYhNr7u6BRBWjpBFkNb8vRptLCgHtk
	oyxK+eAfgnnXR7OIeE3LUSIurdGRT2VZVUIUxQQeq1mnehk+HzZOzwIVPxZaJdW4Il1iqjm8BIO
	dhXQ5YZeYC3jvciwlktNok8HXI
X-Received: by 2002:a05:6102:6a93:b0:5ff:f446:c010 with SMTP id ada2fe7eead31-604f90587f2mr2976603137.7.1774765372862;
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 00:21:13 -0600
Message-ID: <20260329062229.493430-4-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57491-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B6FA350EE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure, potentially leading to stack
corruption and code execution.

Add a bounds check rejecting value_size larger than the value field.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index e18471930..11af71309 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err("port_parameter_set: value_size %u exceeds max %zu\n",
+		       value_size,
+		       sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0



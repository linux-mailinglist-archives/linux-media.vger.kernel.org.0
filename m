Return-Path: <linux-media+bounces-57426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ApAEsWUx2kFZgUAu9opvQ
	(envelope-from <linux-media+bounces-57426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:43:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EAA34DDA3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C63301C585
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6257377EB0;
	Sat, 28 Mar 2026 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQpgEKBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6CC376466
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774687399; cv=none; b=ERq75OeLFJc2fxJ7x1tjvnQUHzCwQNybxkYrUU1Hs02IbdRY5ugRGJJqAuCzukfLLzfXE+60gAlNkp2UACk0Towlon7VrGphjEEPLtc3W4sahSlZ+y5OXXN2TFsQGGzXHO4c8Ty8xqe6U2l4v3ynK/J3VItDrqgkACbRmsF2nYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774687399; c=relaxed/simple;
	bh=w3AmyIUYIWubreSGC4d76/RS+21mmbid9WFgbPya1QY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qHA+Rfg5CoCKVWHnuXO20SXfGGpqhJrq73OhNBzQt5h3yBa1sGvMDQ0Kh+p1MQYN95auXcfkF2NmhQ9XPOxSrysQVtvvgNhvz4u0PvecW35tppb8aCZLcXsNyeJf25JqEqIsOoBt7iHX2OIf3lvLx+WE/trZV6Fbds0xTlGNSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQpgEKBr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7412b07f22so1668319a12.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687397; x=1775292197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc2pVrsVxaLi+fKCDtrvRJf02hSQTkGZjWDQWqQxax0=;
        b=HQpgEKBrQyd/okfaqzKh3+giShN0FpOtgmV68Z3JdNjQ/n+srGizRkdPwbrprQHizZ
         CZlPAsTCn2O4HMpQ4HlDYmoRR0tOaSFhrjaK9zC25QX+gIc+xvfKrE76k/otW9WR1sU1
         IafjB25yN9U+BnGl1TlAHyMCOJQCEb+BgvgHBU+YxZRKEZqfH5hf8y+I+Uze31ZnjYyv
         k0ClBWBIPoczvai8LEBLGlPOTfZbq5jNOICUXOWCw1A2T72+Cnc5qbNGlxySS8xha6dl
         7lGc/83lrKPlhcAtuoc1ETE5Mc1g4sgTiEXyiuu0urlMOYUDNB7nd1Ta8C0+gDAuRF6L
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687397; x=1775292197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc2pVrsVxaLi+fKCDtrvRJf02hSQTkGZjWDQWqQxax0=;
        b=HRIq+HkemPe39pE/fHn2zAGAX6hdLYBRHHaYOinb+aCs0E3kZwjHkxQMSd025vlo7e
         amQU0yJVm4gUcQxLc6byqZ4QmjKuiNKEz2hH8iAEutuyOxJcccGEX6XjAoh/1IfHF9he
         aHdm44izyA+9b8+cEcnq4+FBRmB7fjQmAsiPQ6PW7O/tM3XeshRHvLN9xAqPqsjW4uVv
         9R3YxUD9YOpoOHN9C9u+k2u9W8oWJ9R3WQrm0LzM5iqVzhAMXA0Sq+2IXrLgwi4YNsOV
         RQAjLhO/Lm3scFtR0poTQEuz7fsWb2RR1dNiQWdWUL7LhvZmBH1rzGNqUKrOP2mGdXXV
         2m3w==
X-Forwarded-Encrypted: i=1; AJvYcCU4KEDkBgbce1BTxILFwJ9oB6dCTQxrYRFGMRdHSHTicZuntlt2ucrT6K6CnMcN+4HtWhvwDEqlbelKJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZ2tZSCL1B1dBJUaCgbc7KiU8kh/CPtWGU8iHwGLonUrGjfTY
	CBiMYuBPY4WnQ9fIf+HvbY8hMXUKCoO0nuaOz7kovAUvUCftcE50meh2JQ/AQqsx
X-Gm-Gg: ATEYQzxMWsmLouboYGBKgaQ8V1qAGY/iPCpKwoEgZFJqzPuSIxKIq2iCW7g+vi51Vvp
	d7XZJ13GJAjTWkGGQfVyvQRjjiuAwO01dn2YQ8udq4BlmDDAi0VHi78e0O4eKai+l5lbvqDjOAL
	SsfFSSCfwzGrM+DSfaowPIplN5B046jcKupn/ROfBWTySlr+kUP2Hk8kLr9fUqgLP8x/p1Qqjb1
	6GLGtjKz+HUdoUiRJwlIlyQ2l3NwmZ63MYv3r5TEh22oO1AeYBoaf5XkXHvaw4GiiDM1EHGdCEV
	TzgBm17nvkIrc1PPGrcWNSe0mVaqDid7KbQCwo4ITh7kcG7XMSEW7dpibfgAEgso0Tk5cJTZ6HB
	4QMemTbSjSGbEQPcIQ3ITEwW+8d8BoNPOfdHFDSI8I/Ckgnw+8cNryGDtZfZSUGVWyCPxSUkYCY
	mAO6F77rvhEzVELsjod7UZ/bb197o3wF8RAT3j4xQEdKyrW+HzZTwNlqHFXknaMRDar+letxTYW
	IwO7nc6iKyADoEn
X-Received: by 2002:a05:6a20:72a4:b0:398:7667:b2fb with SMTP id adf61e73a8af0-39c8a9ed52dmr5379451637.19.1774687396754;
        Sat, 28 Mar 2026 01:43:16 -0700 (PDT)
Received: from pranav.. ([2401:4900:c0bc:73e0:ffb5:d097:4f0:3e88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm1795725b3a.8.2026.03.28.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:43:16 -0700 (PDT)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH 0/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Date: Sat, 28 Mar 2026 14:12:37 +0530
Message-Id: <20260328084238.201452-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57426-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranavkharche7@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99EAA34DDA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch converts the HiSilicon hix5hd2 IR remote controller binding from
legacy plaintext format to JSON Schema (DT schema) YAML format. This is part
of the GSoC 2026 Device Tree Bindings conversion project.

The conversion includes:
- Standardized property definitions with proper types and constraints
- Reference to rc.yaml for common IR remote controller properties
- Proper example device tree node with GIC interrupt specifiers
- Support for schema-based validation of device tree sources

Validation Results:
1. Binding schema check passed:
   $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
   ✓ PASSED

2. DTB validation with actual IR node passed:
   $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CHECK_DTBS=y DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/hix5hd2-ir.yaml hisilicon/hi3798cv200-poplar.dtb
   ✓ PASSED

The binding correctly validates the IR controller found in hix5hd2 and
hi3796cv300 HiSilicon SoCs.

---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Pranav Kharche (1):
  dt-bindings: media: convert hix5hd2-ir to DT schema

 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
 .../devicetree/bindings/media/hix5hd2-ir.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.yaml

-- 
2.34.1


Return-Path: <linux-media+bounces-52943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG8xJiG2k2l17wEAu9opvQ
	(envelope-from <linux-media+bounces-52943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97B14848D
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66D3F3003716
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 00:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2899E248880;
	Tue, 17 Feb 2026 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAnOt1cK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB924E4C3
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288092; cv=none; b=ENm0vefMbmFD3eTQGv7C1yNRrer6p7wIeoehsAdGYeLUtqBBgMxnQlNDAHjrh178AqWXtAz41s+B4yf3sBX67v/dhFI0xUvFFyQcwkzeyuir1XfGJRBv8dlN16mozsg3tuXAXLBsHFlFR0RWoDNxeNkGWT3Y0w3P/M8dcgnpcoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288092; c=relaxed/simple;
	bh=1v4dPSgOcOuVrr3Qg9J9gEsFMLIU5i68Rq6Ja2quspc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW+eaKENbq5TqttgMOxHh6rs/703BhKgEmcT9iERvnAV0cLON1sRP2lSdrEf4agAN1+SN9r5Q5rsWNKDi3oEQQpfe4/S6ensOCdj4U9Qr9dEe0I+4WD0Hyf6FoSITf4XsbdVZ+LvCKZOSWqMjKRyFFvCwfNP5p5a/NmgkAqoclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAnOt1cK; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50334dd44d2so44923131cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288090; x=1771892890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JChrl7P28KUq3wAAIILUlLq1kDzZ9Zu7NIGfFL/Hv8=;
        b=HAnOt1cKRSUStA/otjkj27uKR2JkaSAnza1rI/Nyw+mfuSJiCTwDBz+F0p8bCnPXc7
         VMldhHD7k+QCFDfCFNQ/vwyMldauo+2ZQRnhm9fQfKFuApNy2OLtz8zS7MAaLMXbcRJW
         zcarf/KHZ9qn9l+nsF4xyz1SnaVubHRrbe9sWcdB4kLhoO+H8SmKMXtDiJ2Lg4pLI6ru
         92R+tKjL1iuQVyt1/MsR1LeH+DRk9cU8+soHRuGv4i8Qkkkx1o9uWLWVj5tWB1udOlxj
         kAQkbi4WiXEJGxY4bexBons1IlnNIuxSglfhw23RlcqG/d9ep/OpHH7u8pInfp0Kvlvj
         0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288090; x=1771892890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JChrl7P28KUq3wAAIILUlLq1kDzZ9Zu7NIGfFL/Hv8=;
        b=Spg2+LvjdQc6lkMcbKQeBijc4bopdcWu8S5y709enaJu1yeTRbwcN/NHYVqLywAAJA
         rTHZJwKs8LiVoIJEMaXbwQOCxCzKJKQ+r9rmJ4h8NalAHCWlAWNh++qVIckFwjArXg+z
         orUtFLz7WOgiv596FwXvSpKUun1fwtyuaOBsTIEXglnVtmdtt/jV+zy2boXiiO4Im/fG
         p23bdFShMgZSN+7c2jlB1pcrMx2msOc7k2JGOa2ZZLPsNGQo9QzteCiv1FManEE43nDc
         uH4DHj924ZDnVqfeeFpMKMykZt6NlIEOy1OuAYVYaQOS+R1krW053P4iU3iEMs0HS2pR
         v6dg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGkBBuQLg4JQXR0aMUr9H/XotT5TUnNnImfxQlbTuAbYINgQUBZd4CxFvJwGlQVwynMUkDD56Xd8YsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbDFwI3mCtJp/ZTdQxrxk69fchAN+bWhNoYKI9yYWiayJjK/Ov
	tYZ98CnhxMoe673wmN28MEvHswC6uYVeW0Kxi2qGuhfLZ8MbZCnZgV2f
X-Gm-Gg: AZuq6aIZ0QkP1TRK/fXzDmwtNJU6qxRwZ9ik6bUEgoPxO83NQkafbgawPiAKQ9iNbSl
	ZNYLCEOgbrjfRKwIwyZQjZGXBANmTRwNr7g90R/TQhfwE+LKsTXzu1zbRGyADx5RfZCcioyUlwV
	+HLlD7C8FwTA2/5mBYax+V2XSrw7WJMnQ9Zji68wPuzV6/r0NqLGWOOOGdcWjVmCBL9MLVBR/z4
	Cb2K5ezJqDUGWS1nEK2i1ekldjQttRU+zQpnneJd14cGlFobjLD7EDYKFJ/qcjbaYTYWRyL0Pg3
	rt4MwL9es5pkosADM142Rpq1LVTwKrg2iLKAUnfSFTXvdh4Xq+JJ1xEREIhvG6OxBv2Z4C0KGKG
	Fey8qbIlo4SWswvHYs0nTbnWi7inQq6imodoVZ+b6i4//eYKVWu3PmEqDmmazrd+hhtEOotRLdC
	JdvD4JI9oP+e7cZskxChvNvHzWA1H/CQ==
X-Received: by 2002:a05:622a:1654:b0:4f4:d2c3:b236 with SMTP id d75a77b69052e-506b3fffed1mr139068231cf.47.1771288090458;
        Mon, 16 Feb 2026 16:28:10 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847d9852sm161636611cf.7.2026.02.16.16.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:09 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Mon, 16 Feb 2026 19:27:36 -0500
Message-ID: <20260217002738.133534-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52943-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE97B14848D
X-Rspamd-Action: no action

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
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
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
2.53.0



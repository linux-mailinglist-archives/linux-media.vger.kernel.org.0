Return-Path: <linux-media+bounces-66415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHQNAprcRmr3egsAu9opvQ
	(envelope-from <linux-media+bounces-66415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B13166FD098
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NWtU9hCK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66415-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66415-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDA343013B5E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 21:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F65E3AA1BB;
	Thu,  2 Jul 2026 21:48:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14123380FE0
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 21:48:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028886; cv=none; b=rBHDmVh8sNgNv3R1e7qZjNc6A2BSsrO09jgzN1My/1OL9wtOUiqqKqxUnaxXIAqsPH2utw1R+wsB324XX9VnmwS9iLOQJG22Oud68QRHPx4BbEyj9oSqlFZPzVHgtcHEePY2HB/BAirvAn0/hAkLQGxCvP6qLNWR3NM1BnsiDSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028886; c=relaxed/simple;
	bh=Be/cWPQ59xpS4zI4d7uyaSUlPTVzJY+oz2ilnWbcb+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpEJSGQByQLs35RKBHeF+m07BFqISNySbTBwIqATZsnPM6dytXrf4Q010fIz1YEnttq/4MJ5ekuR5M3RR6Mr3oL9EB4gYUy6y34a/ZFewm8jTVyYBf4uCAjYH22awMJUrJOm2khvHGGPuWromFkI1ryCTHl3curRipxNYydWtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWtU9hCK; arc=none smtp.client-ip=74.125.224.45
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6651bc57458so1894932d50.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028883; x=1783633683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=NWtU9hCKxhP6BkiMYqjXFfFBFvlpmEZ84KzdFiyf8nYIIiDxQLehwvec/NtKjYzmHO
         B5jmeQMism+/0iQZdZNRIEQGVOvncfYnvX2Y9LgJfOfG7hdPllLrZLFVsjsiFKKrtRHG
         QSBdcZ6OryHjr+wzxns+RzM+JScb3uicvCkmue/KcnrPffww4KqC5JVhf6FnCe/ZS1UW
         UlJ1jK9OtElrAsXc0aUB1qpkTzgIwanjGwMPV20URlcV4ZJbkX+hnxiFYFIMJ4zKTp7b
         WAG24ZVn1W6fYrExM+Db2qW1e1/r200kYVUrj/8grr7U4IKDHE1ZMCHYVm9oJNBDPWRf
         PBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028883; x=1783633683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=nJE9jtuQaH/PbSz6TtxNwHG7jU/4Y6Z1aBKDuykItRyuZVLZdmAcyocNXfia5/jlpb
         mVl3xMgXdk/FjGOTX32xk6rF14qGublYqYlWZlpFZk5aMjTNenVSXB+mCsBO4R6+oTlZ
         VTRYaeV5x1ETr8rnQPNfod1yIynOREx/NFJsnE8jAAIDNoyTEWI7sk7BoiulEBqSKCc7
         34cEdPZd2vc92JT7oyH6Il+spev+XvWZ9i/Axg0oA5zNwFDSCWm9Jx2YsdGjkc0SQ5Mp
         dv99C3c6NRwcXRfXdLANwEQRlzWMK0yABLircZ518AaiTqK7TrPLxwE2YLU/HXO0YHZ7
         KltQ==
X-Gm-Message-State: AOJu0YwkHsmPeM7iAyROZxEg4l1EMqqXAf/q6HU7kdCS/ZwEE5Rfe8OI
	lxJZepAEZbghVQFwWNGbiJ5WH/CuB19Ox2MUTyQIkirnarRaBRHWAIKo
X-Gm-Gg: AfdE7cnXeWE3lfjERw1sOtbywxsGx/uNqjCDrE76qdGXochcg+ub6jl2WeVZnhujIKp
	48g0j56TaU7VkaLzVMi+Jg45TFJfYnHFUW87Ujf5Uo9D4icIf7JULgHmugDIiLGHeqEwc9xbQbN
	tqVkQhaE0Kc3VfIBYk/1SPbYZUVmwm3hXRBTCx0sdx2pJN54zMeclVGtXfQA5RFOF9JI/JAbYGp
	p8ehjRzmz1oWJmazWgHoNvFk01/5v1p3Buozg5aD3YbfW33G8T1SNY8haB21nwrUsbvZYHFMBRC
	CIOdenXZpN/qSPfDotWZEv69dfU2yFoDfdPlvf9dWHDv7cu63ynSjJ9RqBYz3r9XRZyMQaWBkgf
	+sHsZzp9QEPj9zwo7Tx52Rx0PQ1kAWqXgKqgjfGDOCFKeIvfsG1iQ6Kr/DH15yF2CCKdcS5A0NB
	2GQpHpr8vRb0DLpIbqdHBiS2WprRJ1caDeDQQoyOCNFHgPzlk=
X-Received: by 2002:a05:690e:4089:b0:664:ae6a:ef2 with SMTP id 956f58d0204a3-66596695a62mr6927006d50.80.1783028882666;
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 2/4] media: rc: sunxi-cir: add support for the A523
Date: Thu,  2 Jul 2026 17:47:48 -0400
Message-ID: <20260702214750.3428694-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66415-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:utilityemal77@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,gmail.com,sholland.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B13166FD098

The A523 (sun55i) has a newer revision of the CIR receiver IP. Two
register fields that do not exist on older SoCs must be programmed
for reception to work:

 - CTL bits [7:6] select which pulse polarities are captured into the
   RX FIFO. The reset value of 0 captures nothing, so program "both
   pulse" mode, which captures regardless of header polarity.

 - SPLCFG (the sample configuration register) bits [1:0] select the
   sample clock as a division of the module clock, replacing the
   fixed module clock / 64 sample rate of the older IP. Select
   module clock / 256, which together with the 24 MHz module clock
   used on the A523 gives a 10.7 μs sample period, close to the 8 μs
   of the previous 8 MHz / 64 configuration, and keeps the default
   125 ms idle timeout representable in the 8-bit idle threshold
   field.

Parameterize the sample divisor in the resolution/timeout
calculations, which older SoCs keep at the fixed 64, and add the
A523 quirks and compatible.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 76 ++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index cb4c56bf0752..82ada9dc0347 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -31,6 +31,11 @@
 /* CIR mode */
 #define REG_CTL_MD			(BIT(4) | BIT(5))
 
+/* Pulse mode selector (bits [7:6]) */
+#define REG_CTL_PMD(m)			((m) << 6)
+/* Capture both pulse polarities */
+#define REG_CTL_PMD_BOTH		REG_CTL_PMD(1)
+
 /* Rx Config */
 #define SUNXI_IR_RXCTL_REG    0x10
 /* Pulse Polarity Invert flag */
@@ -66,6 +71,13 @@
 
 /* IR Sample Config */
 #define SUNXI_IR_CIR_REG      0x34
+/*
+ * Sample clock divider select (bits [1:0]), present on newer IP revisions
+ * (e.g. sun55i). Selects the sample clock as a fraction of the module clock;
+ * must be programmed for the sampler to run. Older SoCs lack the field and
+ * use a fixed module-clock/64 sample rate, so they leave it 0.
+ */
+#define REG_CIR_SDIV(val)    ((val) & GENMASK(1, 0))
 /* CIR_REG register noise threshold */
 #define REG_CIR_NTHR(val)    (((val) << 2) & (GENMASK(7, 2)))
 /* CIR_REG register idle threshold */
@@ -73,6 +85,8 @@
 
 /* Required frequency for IR0 or IR1 clock in CIR mode (default) */
 #define SUNXI_IR_BASE_CLK     8000000
+/* Default sample clock divisor: module clock / 64 (legacy fixed rate) */
+#define SUNXI_IR_SAMPLE_DIV   64
 /* Noise threshold in samples  */
 #define SUNXI_IR_RXNOISE      1
 
@@ -81,10 +95,18 @@
  *
  * @has_reset: SoC needs reset deasserted.
  * @fifo_size: size of the fifo.
+ * @both_pulse: program the CTRL pulse-mode field (newer IP revisions).
+ * @sample_div_sel: value for the SPLCFG sample-clock divider field (0 on
+ *		    legacy SoCs that lack the field).
+ * @sample_divisor: module-clock divisor that yields the sample clock; matches
+ *		    @sample_div_sel on newer IP, or the fixed /64 on legacy SoCs.
  */
 struct sunxi_ir_quirks {
 	bool		has_reset;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 };
 
 struct sunxi_ir {
@@ -92,6 +114,9 @@ struct sunxi_ir {
 	void __iomem    *base;
 	int             irq;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 	struct clk      *clk;
 	struct clk      *apb_clk;
 	struct reset_control *rst;
@@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 }
 
 /* Convert idle threshold to usec */
-static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
+static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int div,
+				       unsigned int ithr)
 {
 	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
-				 base_clk / (128 * 64));
+				 base_clk / (128 * div));
 }
 
 /* Convert usec to idle threshold */
-static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
+static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int div,
+				       unsigned int usec)
 {
 	/* make sure we don't end up with a timeout less than requested */
-	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
+	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
 }
 
 static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
@@ -158,15 +185,17 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 	struct sunxi_ir *ir = rc_dev->priv;
 	unsigned int base_clk = clk_get_rate(ir->clk);
 
-	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
+	unsigned int ithr = sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
+					       timeout);
 
 	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
 
-	/* Set noise threshold and idle threshold */
-	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
+	/* Set sample clock divider, noise threshold and idle threshold */
+	writel(REG_CIR_SDIV(ir->sample_div_sel) |
+	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
 	       ir->base + SUNXI_IR_CIR_REG);
 
-	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
+	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ir->sample_divisor, ithr);
 
 	return 0;
 }
@@ -193,8 +222,14 @@ static int sunxi_ir_hw_init(struct device *dev)
 		goto exit_disable_apb_clk;
 	}
 
-	/* Enable CIR Mode */
-	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
+	/*
+	 * Enable CIR Mode. On newer IP revisions the pulse-mode field must
+	 * also be set, otherwise no pulses are captured into the RX FIFO.
+	 */
+	tmp = REG_CTL_MD;
+	if (ir->both_pulse)
+		tmp |= REG_CTL_PMD_BOTH;
+	writel(tmp, ir->base + SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
 	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
@@ -271,6 +306,9 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	}
 
 	ir->fifo_size = quirks->fifo_size;
+	ir->both_pulse = quirks->both_pulse;
+	ir->sample_div_sel = quirks->sample_div_sel;
+	ir->sample_divisor = quirks->sample_divisor ?: SUNXI_IR_SAMPLE_DIV;
 
 	/* Clock */
 	ir->apb_clk = devm_clk_get(dev, "apb");
@@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in us */
-	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
+	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / ir->sample_divisor));
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
-	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
-	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
+	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 0);
+	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 255);
 	ir->rc->s_timeout = sunxi_ir_set_timeout;
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
@@ -395,6 +433,14 @@ static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
 	.fifo_size = 64,
 };
 
+static const struct sunxi_ir_quirks sun55i_a523_ir_quirks = {
+	.has_reset = true,
+	.fifo_size = 64,
+	.both_pulse = true,
+	.sample_div_sel = 2,	/* sample clock = module clock / 256 */
+	.sample_divisor = 256,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-ir",
@@ -408,6 +454,10 @@ static const struct of_device_id sunxi_ir_match[] = {
 		.compatible = "allwinner,sun6i-a31-ir",
 		.data = &sun6i_a31_ir_quirks,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-ir",
+		.data = &sun55i_a523_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.54.0



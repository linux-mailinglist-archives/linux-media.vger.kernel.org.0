Return-Path: <linux-media+bounces-48820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43679CBF52D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 18:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EED3301410D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 17:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9A33246F0;
	Mon, 15 Dec 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3ZbYi41"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A32727E3
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821413; cv=none; b=SM9v3gaOgi7SJPed5O9tj3qyirbbDzY2R7Z3K761XfBt7eWb3lzOAo9g50+qoqTKRHIHk5IT+h067mp9wr07aNjJi6ahLs8u6AgBZBX7MnvlycLPmi67UgBqlaIwf0ZKmzGvFHo82/gVi1KRpEmj7YtIsolVL7JVvEG4JluSLSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821413; c=relaxed/simple;
	bh=eTM4vD/GLrblu1tIANeWjN21pSJ+nVb2OOpffLpnuQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEPAitY63yI25+8IL8mCgRh7hN4rrTJgQYJDEczGwhKkGyY5U2Qyp7EGtw2V08RoASsf4OGeITcOJxOa5PkC4LE2HsCVRYpf5taKIY0LSg2aYPO63+W3hMklLW20MI6T7H3jmcDsQ4rEyZmgFYwl2fPMs3WXPR01LWYyIVCfZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3ZbYi41; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so4593817b3a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 09:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765821410; x=1766426210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjy31YUGfLkTOdV/LJQ8OzVl78sbEt8Ql8lU5c5X1XM=;
        b=M3ZbYi41HfNfUiAGboksMx8syx02xFXKnoH1Mm8qilFA/tTNVgBSB9/iG7YLcTbRRm
         f5+NaNdGYhXS9FvL5CaDi+eEZflWw8ue37DcwTzlyTh/1sA7V3rA2DqmmtH2sCwBjAVd
         HW1QnuPnwtYotCQeT+rKR9mM5TCbFDz3TQ0wqjmyOGxPOLS2Cb/KVQ2ky6J4xsG603q/
         4mm+OhAfQawRSBSx6F1fiBnYJQ+0DScP6IS68JvYDQSOQG/qndlprXM5+mUCSNh433+G
         fnGRIM2v5ht7sP/SAt36Z6aKvK5j49DLhC6ga1C0nrp1IgvS1in4zwRT92exc7Yn/cEe
         8B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821410; x=1766426210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjy31YUGfLkTOdV/LJQ8OzVl78sbEt8Ql8lU5c5X1XM=;
        b=bOOW+mhe+jxVlK2bLKi4L9WRJRSwnwUR7s5EsgKZoiisx+AAhbhgH3I5iSpjsp/zvG
         ujDhqYHJdX+lpRqO4DI4uU03yLQC48NUoxGpskQ0YcxWjn6KfB4CZqe4kpxucta7oBE2
         5HJWVVb5AjD4rXPbs+KzTjCqajt9oPsjZS0RQdM6hReXAksfSkQdJ/nVbXjEzCk8t1zT
         wQ8LSvtxerTcSJwSaLAvh/if0Jna+OEFwn8+J47oQ1THz9SRAkkWUtSE5dTdlxfDAXHE
         VDXiaw5lWmMlwaWGTgmMVL96o1Al/IMgLQEn4REkJoQtpnzyd+nw/KjY7yS4QE8MTKb5
         n+Bw==
X-Gm-Message-State: AOJu0Yyo1FA2KCxQuXLDf9nJCsUSmsPpqvprpBAy77FzZKHiM/ZdufWM
	UF/ZUTgPrOrOZufi7OqGBHL5w7Py6wohL6RFmga9w1aKfOEbIV5UcGBV
X-Gm-Gg: AY/fxX5J3mwJ+iESTzV6LvjRYhVAgcLJRwDUfFrfezpuVnRmhyWko35R3uCLZljlPL8
	KoqWycWaqAPZH8oF9acktYI4XS9lSradItGqrJyJ6CJnpUIliKPotVXAXWMzzbx8LWtcDamHJEl
	dC219iIi/+/zRXm+QUEyxLEfTdQidPaZgry25533znrwcJIAqcycEBohalOZjPP4jirDlIo2PnU
	+mDLMlJGrJSSOOXJvrWjPkznhAy32216tAStw632E/cazNU20niJ/+18rnKtDYy5GFzuk14mk/e
	keMsYy5QjcQj1cONPbr5fk5XVZVYc8+Sm9zEcOz4pLa9+2vnRKhYl0uKkGb024d34WVdOQVHraE
	183lkZXAMTL3m9leEtweaD4SpVJZgxnXYPqOZFE7dPpy2WQQNh2K6dzSixqQnFGgQhNZPTEio1c
	t7e2sSLAM6r5+TamFFgZbthOMdte51PYIq7roJU95bc80aFw==
X-Google-Smtp-Source: AGHT+IGtZYwtKejQoOFuovNjJaFhF72wzKa/tyvI0qT5HW4xRwabzO+9k2CRNE4A5jL/3vIuG5nD1w==
X-Received: by 2002:a05:6a21:6d9e:b0:366:14ac:e1dc with SMTP id adf61e73a8af0-369afff2579mr10516001637.66.1765821410248;
        Mon, 15 Dec 2025 09:56:50 -0800 (PST)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.63.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1361b76c59sm5255040a12.34.2025.12.15.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:56:49 -0800 (PST)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH] media: dvb-core: fix style violation issues
Date: Mon, 15 Dec 2025 23:26:28 +0530
Message-ID: <20251215175639.19377-1-nikhilsunilkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple checkpatch-reported style issues.

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 158 ++++++++++++++++---------------
 1 file changed, 80 insertions(+), 78 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 8bb8dd34c223..4c42d3c7cd14 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -57,11 +57,11 @@
 #include <media/dvb_demux.h>
 #include <media/dvb_net.h>
 
-static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
+static inline __u32 iov_crc32(__u32 c, struct kvec *iov, unsigned int cnt)
 {
 	unsigned int j;
 	for (j = 0; j < cnt; j++)
-		c = crc32_be( c, iov[j].iov_base, iov[j].iov_len );
+		c = crc32_be(c, iov[j].iov_base, iov[j].iov_len);
 	return c;
 }
 
@@ -133,14 +133,14 @@ static __be16 dvb_net_eth_type_trans(struct sk_buff *skb,
 	unsigned char *rawp;
 
 	skb_reset_mac_header(skb);
-	skb_pull(skb,dev->hard_header_len);
+	skb_pull(skb, dev->hard_header_len);
 	eth = eth_hdr(skb);
 
 	if (*eth->h_dest & 1) {
-		if(ether_addr_equal(eth->h_dest,dev->broadcast))
-			skb->pkt_type=PACKET_BROADCAST;
+		if (ether_addr_equal(eth->h_dest, dev->broadcast))
+			skb->pkt_type = PACKET_BROADCAST;
 		else
-			skb->pkt_type=PACKET_MULTICAST;
+			skb->pkt_type = PACKET_MULTICAST;
 	}
 
 	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN)
@@ -178,20 +178,20 @@ static __be16 dvb_net_eth_type_trans(struct sk_buff *skb,
 
 #define ULE_OPTEXTHDR_PADDING 0
 
-static int ule_test_sndu( struct dvb_net_priv *p )
+static int ule_test_sndu(struct dvb_net_priv *p)
 {
 	return -1;
 }
 
-static int ule_bridged_sndu( struct dvb_net_priv *p )
+static int ule_bridged_sndu(struct dvb_net_priv *p)
 {
-	struct ethhdr *hdr = (struct ethhdr*) p->ule_next_hdr;
-	if(ntohs(hdr->h_proto) < ETH_P_802_3_MIN) {
+	struct ethhdr *hdr = (struct ethhdr *) p->ule_next_hdr;
+
+	if (ntohs(hdr->h_proto) < ETH_P_802_3_MIN) {
 		int framelen = p->ule_sndu_len - ((p->ule_next_hdr+sizeof(struct ethhdr)) - p->ule_skb->data);
 		/* A frame Type < ETH_P_802_3_MIN for a bridged frame, introduces a LLC Length field. */
-		if(framelen != ntohs(hdr->h_proto)) {
+		if (framelen != ntohs(hdr->h_proto))
 			return -1;
-		}
 	}
 	/* Note:
 	 * From RFC4326:
@@ -214,15 +214,15 @@ static int ule_exthdr_padding(struct dvb_net_priv *p)
  *  Returns: >= 0: nr. of bytes consumed by next extension header
  *	     -1:   Mandatory extension header that is not recognized or TEST SNDU; discard.
  */
-static int handle_one_ule_extension( struct dvb_net_priv *p )
+static int handle_one_ule_extension(struct dvb_net_priv *p)
 {
 	/* Table of mandatory extension header handlers.  The header type is the index. */
-	static int (*ule_mandatory_ext_handlers[255])( struct dvb_net_priv *p ) =
-		{ [0] = ule_test_sndu, [1] = ule_bridged_sndu, [2] = NULL,  };
+	static int (*ule_mandatory_ext_handlers[255])(struct dvb_net_priv *p) = {
+			[0] = ule_test_sndu, [1] = ule_bridged_sndu, [2] = NULL,  };
 
 	/* Table of optional extension header handlers.  The header type is the index. */
-	static int (*ule_optional_ext_handlers[255])( struct dvb_net_priv *p ) =
-		{ [0] = ule_exthdr_padding, [1] = NULL, };
+	static int (*ule_optional_ext_handlers[255])(struct dvb_net_priv *p) = {
+			[0] = ule_exthdr_padding, [1] = NULL, };
 
 	int ext_len = 0;
 	unsigned char hlen = (p->ule_sndu_type & 0x0700) >> 8;
@@ -232,8 +232,8 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 	if (hlen == 0) {
 		/* Mandatory extension header */
 		if (ule_mandatory_ext_handlers[htype]) {
-			ext_len = ule_mandatory_ext_handlers[htype]( p );
-			if(ext_len >= 0) {
+			ext_len = ule_mandatory_ext_handlers[htype](p);
+			if (ext_len >= 0) {
 				p->ule_next_hdr += ext_len;
 				if (!p->ule_bridged) {
 					p->ule_sndu_type = ntohs(*(__be16 *)p->ule_next_hdr);
@@ -251,9 +251,9 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 		ext_len = hlen << 1;
 		/* Process the optional extension header according to its type. */
 		if (ule_optional_ext_handlers[htype])
-			(void)ule_optional_ext_handlers[htype]( p );
+			(void)ule_optional_ext_handlers[htype](p);
 		p->ule_next_hdr += ext_len;
-		p->ule_sndu_type = ntohs( *(__be16 *)(p->ule_next_hdr-2) );
+		p->ule_sndu_type = ntohs(*(__be16 *)(p->ule_next_hdr-2));
 		/*
 		 * note: the length of the next header type is included in the
 		 * length of THIS optional extension header
@@ -263,13 +263,13 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 	return ext_len;
 }
 
-static int handle_ule_extensions( struct dvb_net_priv *p )
+static int handle_ule_extensions(struct dvb_net_priv *p)
 {
 	int total_ext_len = 0, l;
 
 	p->ule_next_hdr = p->ule_skb->data;
 	do {
-		l = handle_one_ule_extension( p );
+		l = handle_one_ule_extension(p);
 		if (l < 0)
 			return l;	/* Stop extension header processing and discard SNDU. */
 		total_ext_len += l;
@@ -284,7 +284,7 @@ static int handle_ule_extensions( struct dvb_net_priv *p )
 
 
 /* Prepare for a new ULE SNDU: reset the decoder state. */
-static inline void reset_ule( struct dvb_net_priv *p )
+static inline void reset_ule(struct dvb_net_priv *p)
 {
 	p->ule_skb = NULL;
 	p->ule_next_hdr = NULL;
@@ -936,7 +936,8 @@ static void dvb_net_sec(struct net_device *dev,
 	/* we have 14 byte ethernet header (ip header follows);
 	 * 12 byte MPE header; 4 byte checksum; + 2 byte alignment, 8 byte LLC/SNAP
 	 */
-	if (!(skb = dev_alloc_skb(pkt_len - 4 - 12 + 14 + 2 - snap))) {
+	skb = dev_alloc_skb(pkt_len - 4 - 12 + 14 + 2 - snap);
+	if (!skb) {
 		//pr_notice("%s: Memory squeeze, dropping packet.\n", dev->name);
 		stats->rx_dropped++;
 		return;
@@ -949,14 +950,14 @@ static void dvb_net_sec(struct net_device *dev,
 	memcpy(eth + 14, pkt + 12 + snap, pkt_len - 12 - 4 - snap);
 
 	/* create ethernet header: */
-	eth[0]=pkt[0x0b];
-	eth[1]=pkt[0x0a];
-	eth[2]=pkt[0x09];
-	eth[3]=pkt[0x08];
-	eth[4]=pkt[0x04];
-	eth[5]=pkt[0x03];
+	eth[0] = pkt[0x0b];
+	eth[1] = pkt[0x0a];
+	eth[2] = pkt[0x09];
+	eth[3] = pkt[0x08];
+	eth[4] = pkt[0x04];
+	eth[5] = pkt[0x03];
 
-	eth[6]=eth[7]=eth[8]=eth[9]=eth[10]=eth[11]=0;
+	eth[6] = eth[7] = eth[8] = eth[9] = eth[10] = eth[11] = 0;
 
 	if (snap) {
 		eth[12] = pkt[18];
@@ -977,7 +978,7 @@ static void dvb_net_sec(struct net_device *dev,
 	skb->protocol = dvb_net_eth_type_trans(skb, dev);
 
 	stats->rx_packets++;
-	stats->rx_bytes+=skb->len;
+	stats->rx_bytes += skb->len;
 	netif_rx(skb);
 }
 
@@ -1001,10 +1002,10 @@ static netdev_tx_t dvb_net_tx(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static u8 mask_normal[6]={0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-static u8 mask_allmulti[6]={0xff, 0xff, 0xff, 0x00, 0x00, 0x00};
-static u8 mac_allmulti[6]={0x01, 0x00, 0x5e, 0x00, 0x00, 0x00};
-static u8 mask_promisc[6]={0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+static u8 mask_normal[6] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+static u8 mask_allmulti[6] = {0xff, 0xff, 0xff, 0x00, 0x00, 0x00};
+static u8 mac_allmulti[6] = {0x01, 0x00, 0x5e, 0x00, 0x00, 0x00};
+static u8 mask_promisc[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
 static int dvb_net_filter_sec_set(struct net_device *dev,
 		   struct dmx_section_filter **secfilter,
@@ -1013,26 +1014,26 @@ static int dvb_net_filter_sec_set(struct net_device *dev,
 	struct dvb_net_priv *priv = netdev_priv(dev);
 	int ret;
 
-	*secfilter=NULL;
+	*secfilter = NULL;
 	ret = priv->secfeed->allocate_filter(priv->secfeed, secfilter);
-	if (ret<0) {
+	if (ret < 0) {
 		pr_err("%s: could not get filter\n", dev->name);
 		return ret;
 	}
 
-	(*secfilter)->priv=(void *) dev;
+	(*secfilter)->priv = (void *) dev;
 
 	memset((*secfilter)->filter_value, 0x00, DMX_MAX_FILTER_SIZE);
 	memset((*secfilter)->filter_mask,  0x00, DMX_MAX_FILTER_SIZE);
 	memset((*secfilter)->filter_mode,  0xff, DMX_MAX_FILTER_SIZE);
 
-	(*secfilter)->filter_value[0]=0x3e;
-	(*secfilter)->filter_value[3]=mac[5];
-	(*secfilter)->filter_value[4]=mac[4];
-	(*secfilter)->filter_value[8]=mac[3];
-	(*secfilter)->filter_value[9]=mac[2];
-	(*secfilter)->filter_value[10]=mac[1];
-	(*secfilter)->filter_value[11]=mac[0];
+	(*secfilter)->filter_value[0] = 0x3e;
+	(*secfilter)->filter_value[3] = mac[5];
+	(*secfilter)->filter_value[4] = mac[4];
+	(*secfilter)->filter_value[8] = mac[3];
+	(*secfilter)->filter_value[9] = mac[2];
+	(*secfilter)->filter_value[10] = mac[1];
+	(*secfilter)->filter_value[11] = mac[0];
 
 	(*secfilter)->filter_mask[0] = 0xff;
 	(*secfilter)->filter_mask[3] = mac_mask[5];
@@ -1040,7 +1041,7 @@ static int dvb_net_filter_sec_set(struct net_device *dev,
 	(*secfilter)->filter_mask[8] = mac_mask[3];
 	(*secfilter)->filter_mask[9] = mac_mask[2];
 	(*secfilter)->filter_mask[10] = mac_mask[1];
-	(*secfilter)->filter_mask[11]=mac_mask[0];
+	(*secfilter)->filter_mask[11] = mac_mask[0];
 
 	netdev_dbg(dev, "filter mac=%pM mask=%pM\n", mac, mac_mask);
 
@@ -1059,15 +1060,15 @@ static int dvb_net_feed_start(struct net_device *dev)
 	if (priv->tsfeed || priv->secfeed || priv->secfilter || priv->multi_secfilter[0])
 		pr_err("%s: BUG %d\n", __func__, __LINE__);
 
-	priv->secfeed=NULL;
-	priv->secfilter=NULL;
+	priv->secfeed = NULL;
+	priv->secfilter = NULL;
 	priv->tsfeed = NULL;
 
 	if (priv->feedtype == DVB_NET_FEEDTYPE_MPE) {
 		netdev_dbg(dev, "alloc secfeed\n");
-		ret=demux->allocate_section_feed(demux, &priv->secfeed,
+		ret = demux->allocate_section_feed(demux, &priv->secfeed,
 					 dvb_net_sec_callback);
-		if (ret<0) {
+		if (ret < 0) {
 			pr_err("%s: could not allocate section feed\n",
 			       dev->name);
 			goto error;
@@ -1075,10 +1076,10 @@ static int dvb_net_feed_start(struct net_device *dev)
 
 		ret = priv->secfeed->set(priv->secfeed, priv->pid, 1);
 
-		if (ret<0) {
+		if (ret < 0) {
 			pr_err("%s: could not set section feed\n", dev->name);
 			priv->demux->release_section_feed(priv->demux, priv->secfeed);
-			priv->secfeed=NULL;
+			priv->secfeed = NULL;
 			goto error;
 		}
 
@@ -1096,13 +1097,13 @@ static int dvb_net_feed_start(struct net_device *dev)
 			}
 			break;
 		case RX_MODE_ALL_MULTI:
-			priv->multi_num=1;
+			priv->multi_num = 1;
 			netdev_dbg(dev, "set multi_secfilter[0]\n");
 			dvb_net_filter_sec_set(dev, &priv->multi_secfilter[0],
 					       mac_allmulti, mask_allmulti);
 			break;
 		case RX_MODE_PROMISC:
-			priv->multi_num=0;
+			priv->multi_num = 0;
 			netdev_dbg(dev, "set secfilter\n");
 			dvb_net_filter_sec_set(dev, &priv->secfilter, mac, mask_promisc);
 			break;
@@ -1164,10 +1165,10 @@ static int dvb_net_feed_stop(struct net_device *dev)
 				netdev_dbg(dev, "release secfilter\n");
 				priv->secfeed->release_filter(priv->secfeed,
 							      priv->secfilter);
-				priv->secfilter=NULL;
+				priv->secfilter = NULL;
 			}
 
-			for (i=0; i<priv->multi_num; i++) {
+			for (i = 0; i < priv->multi_num; i++) {
 				if (priv->multi_secfilter[i]) {
 					netdev_dbg(dev, "release multi_filter[%d]\n",
 						   i);
@@ -1189,8 +1190,7 @@ static int dvb_net_feed_stop(struct net_device *dev)
 			}
 			priv->demux->release_ts_feed(priv->demux, priv->tsfeed);
 			priv->tsfeed = NULL;
-		}
-		else
+		} else
 			pr_err("%s: no ts feed to stop\n", dev->name);
 	} else
 		ret = -EINVAL;
@@ -1270,7 +1270,7 @@ static void wq_restart_net_feed (struct work_struct *work)
 static int dvb_net_set_mac (struct net_device *dev, void *p)
 {
 	struct dvb_net_priv *priv = netdev_priv(dev);
-	struct sockaddr *addr=p;
+	struct sockaddr *addr = p;
 
 	eth_hw_addr_set(dev, addr->sa_data);
 
@@ -1330,14 +1330,14 @@ static int get_if(struct dvb_net *dvbnet)
 {
 	int i;
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++)
 		if (!dvbnet->state[i])
 			break;
 
 	if (i == DVB_NET_DEVICES_MAX)
 		return -1;
 
-	dvbnet->state[i]=1;
+	dvbnet->state[i] = 1;
 	return i;
 }
 
@@ -1350,7 +1350,8 @@ static int dvb_net_add_if(struct dvb_net *dvbnet, u16 pid, u8 feedtype)
 
 	if (feedtype != DVB_NET_FEEDTYPE_MPE && feedtype != DVB_NET_FEEDTYPE_ULE)
 		return -EINVAL;
-	if ((if_num = get_if(dvbnet)) < 0)
+	if_num = get_if(dvbnet);
+	if (if_num < 0)
 		return -EINVAL;
 
 	net = alloc_netdev(sizeof(struct dvb_net_priv), "dvb",
@@ -1387,7 +1388,8 @@ static int dvb_net_add_if(struct dvb_net *dvbnet, u16 pid, u8 feedtype)
 
 	net->base_addr = pid;
 
-	if ((result = register_netdev(net)) < 0) {
+	result = register_netdev(net);
+	if (result < 0) {
 		dvbnet->device[if_num] = NULL;
 		free_netdev(net);
 		return result;
@@ -1413,7 +1415,7 @@ static int dvb_net_remove_if(struct dvb_net *dvbnet, unsigned long num)
 	flush_work(&priv->restart_net_feed_wq);
 	pr_info("removed network interface %s\n", net->name);
 	unregister_netdev(net);
-	dvbnet->state[num]=0;
+	dvbnet->state[num] = 0;
 	dvbnet->device[num] = NULL;
 	free_netdev(net);
 
@@ -1427,7 +1429,7 @@ static int dvb_net_do_ioctl(struct file *file,
 	struct dvb_net *dvbnet = dvbdev->priv;
 	int ret = 0;
 
-	if (((file->f_flags&O_ACCMODE)==O_RDONLY))
+	if (((file->f_flags&O_ACCMODE) == O_RDONLY))
 		return -EPERM;
 
 	if (mutex_lock_interruptible(&dvbnet->ioctl_mutex))
@@ -1449,13 +1451,13 @@ static int dvb_net_do_ioctl(struct file *file,
 			goto ioctl_error;
 		}
 
-		result=dvb_net_add_if(dvbnet, dvbnetif->pid, dvbnetif->feedtype);
-		if (result<0) {
+		result = dvb_net_add_if(dvbnet, dvbnetif->pid, dvbnetif->feedtype);
+		if (result < 0) {
 			module_put(dvbdev->adapter->module);
 			ret = result;
 			goto ioctl_error;
 		}
-		dvbnetif->if_num=result;
+		dvbnetif->if_num = result;
 		break;
 	}
 	case NET_GET_IF:
@@ -1479,8 +1481,8 @@ static int dvb_net_do_ioctl(struct file *file,
 		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
-		dvbnetif->pid=priv_data->pid;
-		dvbnetif->feedtype=priv_data->feedtype;
+		dvbnetif->pid = priv_data->pid;
+		dvbnetif->feedtype = priv_data->feedtype;
 		break;
 	}
 	case NET_REMOVE_IF:
@@ -1515,13 +1517,13 @@ static int dvb_net_do_ioctl(struct file *file,
 			goto ioctl_error;
 		}
 
-		result=dvb_net_add_if(dvbnet, dvbnetif->pid, DVB_NET_FEEDTYPE_MPE);
-		if (result<0) {
+		result = dvb_net_add_if(dvbnet, dvbnetif->pid, DVB_NET_FEEDTYPE_MPE);
+		if (result < 0) {
 			module_put(dvbdev->adapter->module);
 			ret = result;
 			goto ioctl_error;
 		}
-		dvbnetif->if_num=result;
+		dvbnetif->if_num = result;
 		break;
 	}
 	case __NET_GET_IF_OLD:
@@ -1545,7 +1547,7 @@ static int dvb_net_do_ioctl(struct file *file,
 		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
-		dvbnetif->pid=priv_data->pid;
+		dvbnetif->pid = priv_data->pid;
 		break;
 	}
 	default:
@@ -1637,7 +1639,7 @@ void dvb_net_release (struct dvb_net *dvbnet)
 
 	dvb_unregister_device(dvbnet->dvbdev);
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++) {
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++) {
 		if (!dvbnet->state[i])
 			continue;
 		dvb_net_remove_if(dvbnet, i);
@@ -1655,7 +1657,7 @@ int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
 	mutex_init(&dvbnet->remove_mutex);
 	dvbnet->demux = dmx;
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++)
 		dvbnet->state[i] = 0;
 
 	return dvb_register_device(adap, &dvbnet->dvbdev, &dvbdev_net,
-- 
2.43.0



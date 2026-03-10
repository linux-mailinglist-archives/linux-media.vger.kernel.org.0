Return-Path: <linux-media+bounces-55260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPvWLjaUsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:59:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9A258917
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F23A31AAA8A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA073F2118;
	Tue, 10 Mar 2026 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="oevkaqrX"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF63EF650
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179888; cv=none; b=bgV7YAVbj9g29TqT4ISo+7vH3mbPTW8977aKR6ay2WEvBU6RpBbGYE5Ie8qJLFWFz/fgkRs8TKviKm9cWXkXCUUkrQm0NbaoBm00l9GP46+Kp5m1RDiCyR1U2JzYkM5dl7aJ1kMHm/2EwyLSDdH5uTZzv9r3uyJJ75DX5JQfqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179888; c=relaxed/simple;
	bh=w5SwlclqyXTdbKGjXn6it7SHF2Xr+jHm+FosCZ0szSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+gE/vc6lKzHzcFtwqO0yJ1e5GjLX2AHBK6KydmPTXCSvQycojV1AknQpMGFmz+vUuPaaaA6+cleOpv/USD4mLhy/20UF7LZbow46Xvk/zcHegqLC39blHz589pH/9ZkmcHWG/S9wd04brUyGfbp42cKXCVRyjnU65io7r4S0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=oevkaqrX; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179885; bh=j7EBde1GQXSXhog+I8t8P6zMaGxKlAuOTjo9omb7Eq4=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=oevkaqrXmysEQI+up3K7ow98jigxt40juX9BIqc1TuXKN5W3geyJz8RX1vZBffhDFBFXRbxzJFO7Dt76w2WbOrNyIXdtuX32CyKVwmlMDegmEqvA51Y6FDww21ER9oybH6poQ/fwIfP1QZVKclhhBkDWlyFulNgq2Axypl+KEoboBfcgqYGOHfO8sF6Zkvl+HEClYUOYQHTA/0QgDc8I7n4gQ1dB7+a9DFqXpYN6qkLBtLpc1vtBUtG4L2QgPXfypcDJmA+bqATOt4zjOG+WB/G+AP9MZmV7fzdo3EIrZkLjpYdvUVv94MtXMQepLO7Lo/WmxpJAdC8nawiCNvHA6A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179885; bh=AiSxD+JVI0Z12jozYo/JIrzQdIFcB1KgILi1tlbdRvE=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Q0zdZ2nJvCeM3vogCn/Y5pmm6XDQrKLKczLNMCIrGtSJugxXWsjzQNZ+z4rcUXpINxKpLcDSWfOpsQlc6aQ+getnu9bw3xcz+KkJxWsqsAB2vXFJw+Y/mUjWwKiWKvbPjPXZO2QZQCVKCOCoua0D6vPRsPuJAGJnZn9IwfCk3MIp08gGNxET300gc7I9RbdY4FBnpn4XD4Yq7qs/zOQzjiyI/2rSuIoYYLLtfL2TFG5K8yOsl3uqyziEXlYrvXn/rSSRPYg/ZcmkSp5OXHNv0Uw8HuHqQfE/sF2p9u96XyE0w+ZV7/kMiL3HnAMj/Y+rRVzChpxoW5lxeWxsVvsPXg==
X-YMail-OSG: 5YLwxKIVM1m1ACmBAG5fmpoYZGtlQDvRjs.357yUhjDlzGOdWdeSpaVHsQFHsco
 A7m0kUmgZ7WIPKP8WvA_65naBEChU10cGIXxGHuIBcCW1bvGPIDmG3eY15T6OtAnJzlmKq9SSYhU
 Vn2ymQCmYCvWXm8KvF7LUWS88VYlw3V.vOvWtBF88SfaMIbwjEXX8j5Glr9VlGu17lleS9LmfhwL
 5MObqjz.EAbAWHlVJ.Q1CosPac0bDxU6toAJw6xisYewiBI.ANrRxZCMIH6CEJ.gMjdrJNPApm.l
 fhN7lUnYQ6aDyhOVSLgnZQUCjtyziISKXgK03ez4M5YDU0gCEStCEKZJeWOpmQXK6qPs48ixtFa_
 Z1ueEYHrtmMm.F5LCDFhaRDDzwTXcRZOwnlxD_cJL4lwXGIQn67tm0Mj6ioOI_l58TfNiObpJmjM
 xordSAYYAOb9_mw0Y5Vv4v4UguHTbJ.MXZwKkdwAoWEENJaZYdIFrVZQu7C4y5PapHfAx5yxMFRz
 MPTRzp7W1wZ_7Mmkwr_50dev5reJNUT3EIHMxjt6_ANsoNyFg.LgL6Z0.TK6HIZJK.45irbyhUYl
 euhvcT5Hyo8BcIePmVAsCtR5RwrSogjjVcNp50Tt1fk5ry7BFVFDYRUSar4xfBqmuSUW2qsGTNgd
 .7_mbu5r_helZGaMuD5p8rmmYzlbxyR9ZJTcud1_qrtCaGH6XhvgTaQl7j1CT2Fr05Zp5BdcXYZo
 gSMD.NchhyrjEpMbisKX2pGLUUU1SFMekGYKrju308cajGW6KA6JxZDFjsgdVfzLrLRHGUgOA58A
 DY5lsK5Ax980VlNxYHOCv_BBAmvAo5rzW.0gj4DQk.hJ6sKJGBAB68q.82GfbRaXJMOZVNf6qkIR
 gYir9qXd0VdZsm7JB5yfBC5uTU2PVDiLek6bfyXZZqR6B9F8uC.XVyUL086JhIgpkIez_GGLOxY_
 shevnsx6RfrhVo8q4jWnPBw_y3JmJm79jBEqLrYQBNcallIZtLc59MCmMi_NsVjlJTdqV5y8uH9B
 iecd0YJ6qt8YamXUzFluR.Vs6._X_ZtKYF6.FoCxLd_lSf85sEFWllGaj4084OVA1ZFHPd7IKXUG
 jV56U6qIJZo7eKjyMxDSSDkYq1qLiwmnJR9GuLF4FHnziURr159Oh25ZX29kfxoe53QR0Izpvx.A
 YAWc3zqKoK_MHuPfPDtYWY96UuHk6iBkxj0tDItPnOGeM2nnO4bKEsJkY0ET_PzyNxQsYVN_Kwkp
 c5pGdNRx6PUmTUEFVZDODwxLmYo7M9xCc.N0a3qHTG97DoRHMKPUVtlvGY3WO6ZY4bPnnwjzy_Ap
 qdJ9whOQpH1aO0wPkO650DfzIAsUawVMAnx06Z00NBJdhWaOHMTU4gbyATOu.DNIEHU6jB51T5iK
 yaW2Iu6qoxWpgemTAImuIQZB_LUNMDqlMueEg6071oDqaVTVco4GwX1q3lwQm9t9BlucE0GqxNg8
 hiGdR0ozph95e8uVA_4cofBKeoU.55UDwIoPI2TOvZFrGcSG3VJUopuxjNQBjzIkESZiyKwWt4Be
 593zXgWpH8sTgC8nNa3Fz.wet1oggGNpfqTnxXlRnNuYExYBZkQux0ap0zOtWrLuK1XDANUlfKjz
 9g1gvGfIYwscRIlDs8jOrKtzFzELubOHphGSsDzpSbSpRIxChxQWHRpfd.ggGCBiO5QDTtu5oj98
 MetXIt6w5IXYO1ZeF9HjQlUiPFgfeIPJsHkazxA05IerhTZGyfikZueRM7lyj.XS3D.yrvK4yZgj
 8Y8SzeRXd9HS0K84VDcxGYyRXLIR9YsCTl5Dyls6zlFICWQUgemULaQ1J3Yan2ykUOnwS7AV28lj
 L71tczSAGXS3be7FvUnfEPjQ6h4xaikWJOmbxEn0Fy2oMblDfv7Uit5xyZmj8oBrODoMehWMU2nK
 qsVUKmXGPOon86eTX7gZTuYiqQ9MFoPs4r007obO9.bttv0lVOSc1Qdo4iHAMuNlxmRAHdrUbs4N
 nUJVz4qoYo4V1jBOIMNt5Aqi6fVMympYr13LDmf6q4CMZnej65nxXXp.C3HJhznfNioxk_2cCW9l
 f81aPK54eKQKpv0BF2uDrvWjKgzNe8SawVC6uIIXCQ9KyRUU.ybTmYfa5mlhfrvEjAxBBXutLWCH
 o.589S1eyr59_04xCKtNlZCgyzcuSS8ZGf31k3PQaHofLVRgH.RG_IrX6oZggzoSY4koSSX1c1fS
 hGzekOJlZCi.6Goma9Dl481M24Y1zGPqrJrmQ5TV00zaDUqILthYMGlGgCETi33rMtZoPjmrPSd2
 6zesPXwsc7rs_6FH0RWG090Rhdo21I87l_A--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7d1b577a-0db8-48c9-92a0-4c12af9dc63d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:58:05 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:57 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:56 +0100
Subject: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary
 return statements in ia_css_debug.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-8-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 15F9A258917
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55260-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove redundant 'return;' statements at the end of void functions
in ia_css_debug.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..2e0a13938d89 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -136,7 +136,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
@@ -315,7 +314,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 			    state->fifo_valid);
 	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
 			    state->sink_accept);
-	return;
 }
 
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
@@ -364,7 +362,6 @@ void ia_css_debug_dump_all_fifo_state(void)
 	for (i = 0; i < N_FIFO_CHANNEL; i++)
 		debug_print_fifo_channel_state(&state.fifo_channels[i],
 					       "squepfstqkt");
-	return;
 }
 
 static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
@@ -386,7 +383,6 @@ static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
 	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
 	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
 	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
 }
 
 void ia_css_debug_binary_print(const struct ia_css_binary *bi)
@@ -441,7 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
 }
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
@@ -526,7 +521,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -809,7 +803,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 
 #if SP_DEBUG != SP_DEBUG_NONE
 
-	return;
 }
 #endif
 
@@ -823,7 +816,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 #endif
 	ia_css_bufq_dump_queue_info();
 	ia_css_pipeline_dump_thread_map_info();
-	return;
 }
 
 /* this function is for debug use, it can make SP go to sleep

-- 
2.53.0



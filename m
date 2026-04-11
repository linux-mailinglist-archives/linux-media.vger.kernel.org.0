Return-Path: <linux-media+bounces-58599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC2tFhjE2mmI6AgAu9opvQ
	(envelope-from <linux-media+bounces-58599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:58:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E8C3E1CC3
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FC243012B52
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 21:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE3C386456;
	Sat, 11 Apr 2026 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="jbAPpTJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9FE1D5CC9
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775944723; cv=none; b=Mn9Tbj80uSnmxJqRrGpyXj8rca7J0EF4fFJmuRW/Y+ir+fVYv4SvJnXU98xzl1w/99KZu90G00Zodgc6RrZiOEqq/Vm5swUnU14WCP6OIQ22dzvUpvEi4nq+2XjenLiF6JaPHQAuaDObo1F6jkzh3Jlx0SXsv7rvifrGvq54dvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775944723; c=relaxed/simple;
	bh=n3VRvifBXS9XNjvzVWfxlBIJoPzA3F8CTLqUvnGf7jw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FbyVn4l6TDnr4z6AHKgOmUhmcazK+MFLdh+qiQjR/AnPXnfHUMI9ApOMswD7CMownPSOtNlHKfRVwUf00xpR0wWGldlijdNU9Pu6qxhSPhaVjkwgv8g2hLi42b8Vg3qUmil9zN3A+l6jqgdsbJ2EQ5S8+RC/jpBZ5pu+hMGoOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=jbAPpTJJ; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n3VRvifBXS9XNjvzVWfxlBIJoPzA3F8CTLqUvnGf7jw=; b=jbAPpTJJW1N+8I91QRRV7b3KvH
	rODRfWOkVEGbmp6LJa4B94MTY7pa+dgXvIvt5dRdEEgEWayL5meu3LwsP7rSnt0YBCbBAFapdx0nu
	YdLB/879Wlsc893J8WYw3ABVISQw/YRTS/CK27eHULNbKlaLfTnTxOnqZPxUDYow6F1kmJy9/ZAIl
	cQvvcPlpxcGCBPb6FICdX/JAdcGjgM2YK6D/3ilA+ZkFe3WS5QYotPwQZBJ4xjjKEO1esa5HTfu9A
	7K9S9iiSNRsWh9oHs8ey0Y8TQrpQMVI7TLEXW+VcH7pJ0c5vta2nbYxzAy/4qqduk89X5mIQwQY85
	lsGsyZ8Q==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgLh-0002Go-0C;
	Sat, 11 Apr 2026 21:58:41 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgLg-000hBG-3A;
	Sat, 11 Apr 2026 21:58:41 +0000
Date: Sat, 11 Apr 2026 21:58:40 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1124698167.4.1775944720977@builder.linuxtv.org>
In-Reply-To: <1605095208.3.1775944647262@builder.linuxtv.org>
References: <1605095208.3.1775944647262@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #44
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[linuxtv.org:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58599-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,builder.linuxtv.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8E8C3E1CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/44/display/redirect>

Changes:


------------------------------------------
[...truncated 11.01 KiB...]
[31/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/descriptors_desc_partial_reception.c.o
[32/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/descriptors_desc_service.c.o
[33/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/descriptors_desc_network_name.c.o
[34/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/descriptors_desc_terrestrial_delivery.c.o
[35/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-demux.c.o
[36/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/descriptors_desc_ts_info.c.o
[37/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-dev.c.o
[38/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-log.c.o
[39/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-dev-remote.c.o
[40/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-file.c.o
[41/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-legacy-channel-format.c.o
[42/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-v5-std.c.o
[43/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-v5.c.o
[44/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-dev-local.c.o
[45/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-fe.c.o
[46/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-sat.c.o
[47/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-vb2.c.o
[48/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-vdr-format.c.o
[49/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-zap-format.c.o
[50/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_atsc_eit.c.o
[51/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/parse_string.c.o
[52/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/dvb-scan.c.o
[53/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_cat.c.o
[54/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_mgt.c.o
[55/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_mpeg_ts.c.o
[56/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_header.c.o
[57/259] Compiling C object lib/libv4lconvert/ov511-decomp.p/ov511-decomp.c.o
[58/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_eit.c.o
[59/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_mpeg_es.c.o
[60/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_mpeg_pes.c.o
[61/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_nit.c.o
[62/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_pat.c.o
[63/259] Compiling C object lib/libv4lconvert/ov518-decomp.p/ov518-decomp.c.o
[64/259] Linking target lib/libv4lconvert/ov511-decomp
[65/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_pmt.c.o
[66/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_sdt.c.o
[67/259] Compiling C object lib/libdvbv5/libdvbv5.a.p/tables_vct.c.o
[68/259] Linking target lib/libv4lconvert/ov518-decomp
[69/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/jidctflt.c.o
[70/259] Linking static target lib/libdvbv5/libdvbv5.a
[71/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/control_libv4lcontrol.c.o
[72/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/jl2005bcd.c.o
[73/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/jpeg.c.o
[74/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/cpia1.c.o
[75/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/flip.c.o
[76/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/mr97310a.c.o
[77/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/crop.c.o
[78/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/processing_gamma.c.o
[79/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/nv12_16l16.c.o
[80/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/pac207.c.o
[81/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/processing_autogain.c.o
[82/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/processing_whitebalance.c.o
[83/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/processing_libv4lprocessing.c.o
[84/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/bayer.c.o
[85/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/jpgl.c.o
[86/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/sn9c10x.c.o
[87/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/se401.c.o
[88/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/sn9c20x.c.o
[89/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/stv0680.c.o
[90/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/sn9c2028-decomp.c.o
[91/259] Compiling C object lib/libv4l2/libv4l2.a.p/libv4l2.c.o
[92/259] Compiling C object lib/libv4l2/v4l2convert.so.p/v4l2convert.c.o
[93/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/spca501.c.o
[94/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/helper.c.o
[95/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/sq905c.c.o
[96/259] Compiling C object lib/libv4l2/libv4l2.a.p/v4l2-plugin.c.o
[97/259] Compiling C object lib/libv4l1/v4l1compat.so.p/v4l1compat.c.o
[98/259] Compiling C object lib/libv4l2/libv4l2.a.p/log.c.o
[99/259] Compiling C object lib/libv4l-mplane/libv4l-mplane.so.p/libv4l-mplane.c.o
[100/259] Compiling C object lib/libv4l1/libv4l1.a.p/libv4l1.c.o
[101/259] Linking static target lib/libv4l2/libv4l2.a
[102/259] Compiling C object lib/libv4l2rds/libv4l2rds.a.p/libv4l2rds.c.o
[103/259] Compiling C object lib/libv4l1/libv4l1.a.p/log.c.o
[104/259] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-info.cpp.o
[105/259] Linking target lib/libv4l-mplane/libv4l-mplane.so
[106/259] Linking static target lib/libv4l2rds/libv4l2rds.a
[107/259] Linking static target lib/libv4l1/libv4l1.a
[108/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/spca561-decompress.c.o
[109/259] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-parse.cpp.o
[110/259] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-log.cpp.o
[111/259] Compiling C object utils/libmedia_dev/libmedia_dev.a.p/get_media_devices.c.o
[112/259] Linking static target utils/libmedia_dev/libmedia_dev.a
[113/259] Linking static target utils/libcecutil/libcecutil.a
[114/259] Compiling C object utils/libv4l2util/libv4l2util.a.p/frequencies.c.o
[115/259] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-pin.cpp.o
[116/259] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
[117/259] Compiling C++ object utils/cec-follower/cec-follower.p/cec-follower.cpp.o
[118/259] Compiling C++ object utils/cec-follower/cec-follower.p/cec-tuner.cpp.o
[119/259] Compiling C++ object utils/cec-follower/cec-follower.p/cec-processing.cpp.o
[120/259] Generating utils/media-bus-format-names.h with a custom command (wrapped by meson to capture output)
[121/259] Compiling C object utils/libv4l2util/libv4l2util.a.p/v4l2_driver.c.o
[122/259] Compiling C object utils/dvb/dvb-fe-tool.p/dvb-fe-tool.c.o
[123/259] Compiling C object utils/cx18-ctl/cx18-ctl.p/cx18-ctl.c.o
[124/259] Compiling C object utils/dvb/dvbv5-zap.p/dvbv5-zap.c.o
[125/259] Generating utils/media-bus-format-codes.h with a custom command (wrapped by meson to capture output)
[126/259] Compiling C object utils/dvb/dvbv5-scan.p/dvbv5-scan.c.o
[127/259] Linking static target utils/libv4l2util/libv4l2util.a
[128/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/libv4lconvert.c.o
[129/259] Linking target utils/cx18-ctl/cx18-ctl
[130/259] Compiling C object utils/dvb/dvb-format-convert.p/dvb-format-convert.c.o
[131/259] Linking target utils/dvb/dvb-fe-tool
[132/259] Linking target utils/dvb/dvbv5-zap
[133/259] Compiling C++ object utils/edid-decode/edid-decode.p/calc-gtf-cvt.cpp.o
[134/259] Compiling C object utils/dvb/dvbv5-daemon.p/dvbv5-daemon.c.o
[135/259] Compiling C++ object utils/edid-decode/edid-decode.p/edid-decode.cpp.o
[136/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-base-block.cpp.o
[137/259] Linking target utils/dvb/dvbv5-scan
[138/259] Compiling C++ object utils/edid-decode/edid-decode.p/calc-ovt.cpp.o
[139/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-di-ext-block.cpp.o
[140/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-cta-block.cpp.o
[141/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-displayid-block.cpp.o
[142/259] Linking target utils/cec-ctl/cec-ctl
[143/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-eld.cpp.o
[144/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-vtb-ext-block.cpp.o
[145/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-if.cpp.o
[146/259] Compiling C++ object utils/edid-decode/edid-decode.p/ddc.cpp.o
[147/259] Linking target utils/cec-follower/cec-follower
[148/259] Compiling C++ object utils/edid-decode/edid-decode.p/parse-ls-ext-block.cpp.o
[149/259] Compiling C object utils/ir-ctl/ir-ctl.p/bpf_encoder.c.o
[150/259] Compiling C object utils/ir-ctl/ir-ctl.p/ir-ctl.c.o
[151/259] Compiling C object utils/ir-ctl/ir-ctl.p/ir-encode.c.o
[152/259] Linking target utils/dvb/dvb-format-convert
[153/259] Linking target utils/dvb/dvbv5-daemon
[154/259] Compiling C object utils/ir-ctl/ir-ctl.p/keymap.c.o
[155/259] Compiling C object utils/ir-ctl/ir-ctl.p/toml.c.o
[156/259] Compiling C object utils/ivtv-ctl/ivtv-ctl.p/ivtv-ctl.c.o
[157/259] Compiling C object utils/keytable/ir-keytable.p/ir-encode.c.o
[158/259] Compiling C object utils/keytable/ir-keytable.p/keymap.c.o
[159/259] Compiling C object utils/keytable/ir-keytable.p/toml.c.o
[160/259] Compiling C object utils/keytable/ir-keytable.p/keytable.c.o
[161/259] Compiling C object utils/media-ctl/libmediactl.a.p/libmediactl.c.o
[162/259] Compiling C object utils/media-ctl/libv4l2subdev.a.p/libv4l2subdev.c.o
[163/259] Compiling C object utils/media-ctl/media-ctl.p/media-ctl.c.o
[164/259] Compiling C object utils/media-ctl/media-ctl.p/options.c.o
[165/259] Linking target utils/ir-ctl/ir-ctl
[166/259] Linking target utils/ivtv-ctl/ivtv-ctl
[167/259] Linking static target utils/media-ctl/libmediactl.a
[168/259] Linking static target utils/media-ctl/libv4l2subdev.a
[169/259] Compiling C++ object utils/rds-ctl/rds-ctl.p/rds-ctl.cpp.o
[170/259] Linking target utils/keytable/ir-keytable
[171/259] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-fwht.c.o
[172/259] Compiling C++ object utils/rds-ctl/rds-ctl.p/v4l2-info.cpp.o
[173/259] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-v4l2-fwht.c.o
[174/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/media-info.cpp.o
[175/259] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l-stream.c.o
[176/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-common.cpp.o
[177/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-edid.cpp.o
[178/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-io.cpp.o
[179/259] Linking target utils/media-ctl/media-ctl
[180/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-meta.cpp.o
[181/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-misc.cpp.o
[182/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-modes.cpp.o
[183/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-overlay.cpp.o
[184/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-selection.cpp.o
[185/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-stds.cpp.o
[186/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-subdev.cpp.o
[187/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vbi.cpp.o
[188/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidcap.cpp.o
[189/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-sdr.cpp.o
[190/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-streaming.cpp.o
[191/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidout.cpp.o
[192/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl.cpp.o
[193/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-info.cpp.o
[194/259] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-colors.c.o
[195/259] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-core.c.o
[196/259] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-tuner.cpp.o
[197/259] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-dbg.cpp.o
[198/259] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-info.cpp.o
[199/259] Compiling C object utils/v4l2-sysfs-path/v4l2-sysfs-path.p/v4l2-sysfs-path.c.o
[200/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-compliance.cpp.o
[201/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-adapter.cpp.o
[202/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-audio.cpp.o
[203/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-fuzzing.cpp.o
[204/259] Linking target utils/edid-decode/edid-decode
[205/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-power.cpp.o
[206/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-tuner-record-timer.cpp.o
[207/259] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test.cpp.o
[208/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/media-info.cpp.o
[209/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-compliance.cpp.o
[210/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/rgbyuv.c.o
[211/259] Linking target utils/v4l2-sysfs-path/v4l2-sysfs-path
[212/259] Linking target utils/rds-ctl/rds-ctl
[213/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-colors.cpp.o
[214/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-info.cpp.o
[215/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-codecs.cpp.o
[216/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-debug.cpp.o
[217/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-controls.cpp.o
[218/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-input-output.cpp.o
[219/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-formats.cpp.o
[220/259] Compiling C object contrib/test/sliced-vbi-test.p/sliced-vbi-test.c.o
[221/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-time32-64.cpp.o
[222/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-subdevs.cpp.o
[223/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-buffers.cpp.o
[224/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-io-config.cpp.o
[225/259] Compiling C object contrib/test/sliced-vbi-detect.p/sliced-vbi-detect.c.o
[226/259] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-media.cpp.o
[227/259] Compiling C object contrib/test/ioctl-test.p/ioctl-test.c.o
[228/259] Compiling C object contrib/test/v4l2grab.p/v4l2grab.c.o
[229/259] Compiling C object contrib/test/driver-test.p/driver-test.c.o
[230/259] Compiling C object contrib/test/mc-nextgen-test.p/mc_nextgen_test.c.o
[231/259] Compiling C object contrib/test/stress-buffer.p/stress-buffer.c.o
[232/259] Linking target utils/v4l2-dbg/v4l2-dbg
[233/259] Linking target contrib/test/sliced-vbi-test
[234/259] Compiling C object contrib/test/capture-example.p/capture-example.c.o
[235/259] Compiling C object contrib/test/pixfmt-test.p/pixfmt-test.c.o
[236/259] Linking target contrib/test/sliced-vbi-detect
[237/259] Linking target contrib/test/ioctl-test
[238/259] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
[239/259] Linking target contrib/test/driver-test
[240/259] Linking target contrib/test/mc-nextgen-test
[241/259] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/standards.c.o
[242/259] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/firmware-tool.c.o
[243/259] Compiling C object contrib/rds-saa6588/rds-saa6588.p/rds-saa6588.c.o
[244/259] Linking target contrib/test/capture-example
[245/259] Linking target contrib/test/stress-buffer
[246/259] Compiling C object contrib/decode_tm6000/decode_tm6000.p/decode_tm6000.c.o
[247/259] Linking target utils/cec-compliance/cec-compliance
[248/259] Linking target contrib/xc3028-firmware/xc3028-firmware
[249/259] Linking target contrib/test/pixfmt-test
[250/259] Linking target contrib/rds-saa6588/rds-saa6588
[251/259] Linking target contrib/decode_tm6000/decode_tm6000
[252/259] Compiling C object lib/libv4lconvert/libv4lconvert.a.p/tinyjpeg.c.o
[253/259] Linking static target lib/libv4lconvert/libv4lconvert.a
[254/259] Linking target lib/libv4l2/v4l2convert.so
[255/259] Linking target lib/libv4l1/v4l1compat.so
[256/259] Linking target contrib/test/v4l2grab
[257/259] Linking target contrib/test/v4l2gl
[258/259] Linking target utils/v4l2-ctl/v4l2-ctl
[259/259] Linking target utils/v4l2-compliance/v4l2-compliance
+ pwd
+ DVB_FORMAT_CONVERT=<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/build/utils/dvb/dvb-format-convert> make
ERROR value 1/4 is invalid for INNER_FEC while parsing line 37 of dvb-s/Amos-4-65.0E
Error reading file dvb-s/Amos-4-65.0E
Reading file dvb-s/Amos-4-65.0E
make: *** [Makefile:49: dvbv3/dvb-s/Amos-4-65.0E] Error 255
make: *** Waiting for unfinished jobs....
Reading file dvb-s/Arabsat-5A-30.5E
Writing file dvbv3/dvb-s/Arabsat-5A-30.5E
Reading file dvb-s/Arabsat-5C-20.0E
Writing file dvbv3/dvb-s/Arabsat-5C-20.0E
Reading file dvb-s/Arsat-1-71.8W
Writing file dvbv3/dvb-s/Arsat-1-71.8W
Reading file dvb-s/Arabsat-6A-30.5E
Writing file dvbv3/dvb-s/Arabsat-6A-30.5E
Reading file dvb-s/Arsat-2-81.0W
Writing file dvbv3/dvb-s/Arsat-2-81.0W
Reading file dvb-s/AsiaSat-5-100.5E
Writing file dvbv3/dvb-s/AsiaSat-5-100.5E
Build step 'Execute shell' marked build as failure


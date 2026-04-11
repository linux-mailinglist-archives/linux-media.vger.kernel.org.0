Return-Path: <linux-media+bounces-58582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JpaNICEt2mn/ywgAu9opvQ
	(envelope-from <linux-media+bounces-58582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:14:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C501B3DF729
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A97D030221E1
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA18634107D;
	Sat, 11 Apr 2026 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="RsCopc8l"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F922E542C
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775906072; cv=none; b=ZLhFHqma8oF3Cq5miHQBG+mGBnEM2OL6RXAYQGddKSrS2Gaqliuw674DGw3uN9n4Un6jS/B81saNjb3Am1uAo3JqubjcQYWIk2AoyEvHf7KBXLC66yN5xKDYJvtfKdnDk+5IoeDBGqSHpkPhk1r+IwUBWHt7K/AecA4iCn0+mWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775906072; c=relaxed/simple;
	bh=ylR9PK2UEqsS3iGZcg47oJhn1I1q36HEM/AJlxPSQUU=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Sz41YAUja1fZD2RwV1B54xP42KBYNSmq6YFyDxCkfJV/GVLDMupVfrrIrIqYFhg1X9I1RZwIwAKIpst+vTJhNFypt4RHVayYwhb99pCBbDqv9sqpMlRSSSnCORe1mtQpDYt136JZeIx3G/b2vr/+zTXuJNnAvHcuYQs40bDMgrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=RsCopc8l; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ylR9PK2UEqsS3iGZcg47oJhn1I1q36HEM/AJlxPSQUU=; b=RsCopc8l4SWjUMdY8aDfBW8YKp
	eWjv6dKw2c/92tv8V4BFynoQz7mUpXejXatI18gV7THQHTV0Z+L7LzpBZIa+0Hv8siy+1aJEY18WW
	Ik1I2A9Hr4pHyxXGFVwmRZkw2iGXmaodvSWDwR8O3XijXlMyr6RMNMFMO7xnQYhKjt+FCk3EAMELY
	sZWETl1fErjVtCfKfRbnv9tpjB6KfiDEAnOxi40OqRCb7duurlrw7bepdPUZdYx6y8tkAtdzV4T7j
	CPmyYc7ObOa/zNk+O9CHyC0AM877Co9mv9tHyv95NuCdnTfwE8yqv5Wuu2yRK5PVud76oad2MVbfi
	n+c73P8g==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBWII-0007cC-0Y;
	Sat, 11 Apr 2026 11:14:30 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBWII-000dy4-06;
	Sat, 11 Apr 2026 11:14:30 +0000
Date: Sat, 11 Apr 2026 11:14:29 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <181607545.1.1775906070029@builder.linuxtv.org>
In-Reply-To: <2108603301.8.1775659257885@builder.linuxtv.org>
References: <2108603301.8.1775659257885@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #41
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58582-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: C501B3DF729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/41/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] Update satellite lists from Lyngsat and KingOfSat


------------------------------------------
[...truncated 17.07 KiB...]
[110/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-info.cpp.o
[111/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-log.cpp.o
[112/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-parse.cpp.o
[113/309] Compiling C object utils/libmedia_dev/libmedia_dev.a.p/get_media_devices.c.o
[114/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/frequencies.c.o
[115/309] Linking static target utils/libcecutil/libcecutil.a
[116/309] Linking static target utils/libmedia_dev/libmedia_dev.a
[117/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/v4l2_driver.c.o
[118/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-pin.cpp.o
[119/309] Linking static target utils/libv4l2util/libv4l2util.a
[120/309] Compiling C object utils/dvb/dvb-fe-tool.p/dvb-fe-tool.c.o
[121/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-processing.cpp.o
[122/309] Compiling C object utils/cx18-ctl/cx18-ctl.p/cx18-ctl.c.o
[123/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-tuner.cpp.o
[124/309] Generating symbol file lib/libv4l2rds/libv4l2rds.so.0.0.0.p/libv4l2rds.so.0.0.0.symbols
[125/309] Compiling C object lib/libdvbv5/libdvbv5.so.0.0.0.p/dvb-file.c.o
[126/309] Compiling C object utils/dvb/dvbv5-scan.p/dvbv5-scan.c.o
[127/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.c.o
[128/309] Linking target utils/cx18-ctl/cx18-ctl
[129/309] Generating symbol file lib/libv4lconvert/libv4lconvert.so.0.0.0.p/libv4lconvert.so.0.0.0.symbols
[130/309] Compiling C object utils/dvb/dvb-format-convert.p/dvb-format-convert.c.o
[131/309] Compiling C object utils/dvb/dvbv5-zap.p/dvbv5-zap.c.o
[132/309] Compiling C object utils/dvb/dvbv5-daemon.p/dvbv5-daemon.c.o
[133/309] Linking target lib/libdvbv5/libdvbv5.so.0.0.0
[134/309] Linking target lib/libv4l2/libv4l2.so.0.0.0
[135/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-gtf-cvt.cpp.o
[136/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-ovt.cpp.o
[137/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-base-block.cpp.o
[138/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-di-ext-block.cpp.o
[139/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-cta-block.cpp.o
[140/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-vtb-ext-block.cpp.o
[141/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-ls-ext-block.cpp.o
[142/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-if.cpp.o
[143/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-displayid-block.cpp.o
[144/309] Compiling C object utils/ir-ctl/ir-ctl.p/bpf_encoder.c.o
[145/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-encode.c.o
[146/309] Generating symbol file lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.so.0.0.0.symbols
[147/309] Compiling C object utils/ir-ctl/ir-ctl.p/keymap.c.o
[148/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-ctl.c.o
[149/309] Generating symbol file lib/libdvbv5/libdvbv5.so.0.0.0.p/libdvbv5.so.0.0.0.symbols
[150/309] Linking target lib/libv4l2/v4l2convert.so
[151/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-eld.cpp.o
[152/309] Linking target lib/libv4l1/libv4l1.so.0.0.0
[153/309] Compiling C object utils/ir-ctl/ir-ctl.p/toml.c.o
[154/309] Compiling C++ object utils/edid-decode/edid-decode.p/ddc.cpp.o
[155/309] Linking target utils/dvb/dvb-fe-tool
[156/309] Linking target utils/dvb/dvbv5-zap
[157/309] Linking target utils/dvb/dvbv5-scan
[158/309] Compiling C object utils/ivtv-ctl/ivtv-ctl.p/ivtv-ctl.c.o
[159/309] Linking target utils/ir-ctl/ir-ctl
[160/309] Linking target utils/dvb/dvb-format-convert
[161/309] Compiling C object utils/keytable/ir-keytable.p/ir-encode.c.o
[162/309] Linking target utils/dvb/dvbv5-daemon
[163/309] Compiling C object utils/keytable/ir-keytable.p/keymap.c.o
[164/309] Linking target utils/ivtv-ctl/ivtv-ctl
[165/309] Compiling C object utils/keytable/ir-keytable.p/toml.c.o
[166/309] Generating utils/qv4l2/qt5-qv4l2_qrc with a custom command
[167/309] Generating 'utils/qv4l2/qv4l2.p/moc_qv4l2.cpp'.
[168/309] Compiling C object utils/keytable/ir-keytable.p/keytable.c.o
[169/309] Generating 'utils/qv4l2/qv4l2.p/moc_general-tab.cpp'.
[170/309] Compiling C object utils/media-ctl/libmediactl.a.p/libmediactl.c.o
[171/309] Generating 'utils/qv4l2/qv4l2.p/moc_vbi-tab.cpp'.
[172/309] Generating 'utils/qv4l2/qv4l2.p/moc_capture-win.cpp'.
[173/309] Compiling C object utils/media-ctl/media-ctl.p/media-ctl.c.o
[174/309] Linking static target utils/media-ctl/libmediactl.a
[175/309] Compiling C object utils/media-ctl/libv4l2subdev.a.p/libv4l2subdev.c.o
[176/309] Linking target utils/keytable/ir-keytable
[177/309] Linking static target utils/media-ctl/libv4l2subdev.a
[178/309] Generating symbol file lib/libv4l1/libv4l1.so.0.0.0.p/libv4l1.so.0.0.0.symbols
[179/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_.._qt5-qv4l2_qrc.cpp.o
[180/309] Linking target lib/libv4l1/v4l1compat.so
[181/309] Compiling C object utils/media-ctl/media-ctl.p/options.c.o
[182/309] Linking target utils/media-ctl/media-ctl
[183/309] Compiling C object utils/qv4l2/qv4l2.p/alsa_stream.c.o
[184/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_vbi-tab.cpp.o
[185/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_qv4l2.cpp.o
[186/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-follower.cpp.o
[187/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_capture-win.cpp.o
[188/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_general-tab.cpp.o
[189/309] Linking target utils/cec-follower/cec-follower
[190/309] Compiling C++ object utils/qv4l2/qv4l2.p/raw2sliced.cpp.o
[191/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-colors.c.o
[192/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win.cpp.o
[193/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-qt.cpp.o
[194/309] Generating utils/qvidcap/qt5-qvidcap_qrc with a custom command
[195/309] Generating 'utils/qvidcap/qvidcap.p/moc_capture.cpp'.
[196/309] Compiling C++ object utils/qv4l2/qv4l2.p/ctrl-tab.cpp.o
[197/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-core.c.o
[198/309] Compiling C++ object utils/qv4l2/qv4l2.p/general-tab.cpp.o
[199/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-gl.cpp.o
[200/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_.._qt5-qvidcap_qrc.cpp.o
[201/309] Compiling C object utils/qvidcap/qvidcap.p/codec-fwht.c.o
[202/309] Compiling C++ object utils/qv4l2/qv4l2.p/tpg-tab.cpp.o
[203/309] Compiling C object utils/qvidcap/qvidcap.p/codec-v4l2-fwht.c.o
[204/309] Compiling C object utils/qvidcap/qvidcap.p/v4l-stream.c.o
[205/309] Compiling C++ object utils/qvidcap/qvidcap.p/v4l2-info.cpp.o
[206/309] Compiling C++ object utils/qv4l2/qv4l2.p/vbi-tab.cpp.o
[207/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-colors.c.o
[208/309] Compiling C++ object utils/qv4l2/qv4l2.p/qv4l2.cpp.o
[209/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_moc_capture.cpp.o
[210/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-core.c.o
[211/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/rds-ctl.cpp.o
[212/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/v4l2-info.cpp.o
[213/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-fwht.c.o
[214/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-v4l2-fwht.c.o
[215/309] Compiling C++ object utils/qvidcap/qvidcap.p/qvidcap.cpp.o
[216/309] Linking target utils/rds-ctl/rds-ctl
[217/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/media-info.cpp.o
[218/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l-stream.c.o
[219/309] Compiling C++ object utils/qvidcap/qvidcap.p/capture.cpp.o
[220/309] Compiling C++ object utils/qvidcap/qvidcap.p/paint.cpp.o
[221/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-common.cpp.o
[222/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-edid.cpp.o
[223/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-meta.cpp.o
[224/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-io.cpp.o
[225/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-modes.cpp.o
[226/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-sdr.cpp.o
[227/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-misc.cpp.o
[228/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-overlay.cpp.o
[229/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-selection.cpp.o
[230/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-stds.cpp.o
[231/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-subdev.cpp.o
[232/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidcap.cpp.o
[233/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-tuner.cpp.o
[234/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-streaming.cpp.o
[235/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vbi.cpp.o
[236/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidout.cpp.o
[237/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-colors.c.o
[238/309] Compiling C object utils/v4l2-sysfs-path/v4l2-sysfs-path.p/v4l2-sysfs-path.c.o
[239/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-info.cpp.o
[240/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-core.c.o
[241/309] Linking target utils/v4l2-sysfs-path/v4l2-sysfs-path
[242/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-dbg.cpp.o
[243/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-info.cpp.o
[244/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-audio.cpp.o
[245/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-fuzzing.cpp.o
[246/309] Linking target utils/qvidcap/qvidcap
[247/309] Linking target utils/v4l2-dbg/v4l2-dbg
[248/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-adapter.cpp.o
[249/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-power.cpp.o
[250/309] Linking target utils/qv4l2/qv4l2
[251/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/media-info.cpp.o
[252/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test.cpp.o
[253/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-tuner-record-timer.cpp.o
[254/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-info.cpp.o
[255/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-codecs.cpp.o
[256/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-colors.cpp.o
[257/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-buffers.cpp.o
[258/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-controls.cpp.o
[259/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-formats.cpp.o
[260/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-debug.cpp.o
[261/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-input-output.cpp.o
[262/309] Compiling C object contrib/test/ioctl-test.p/ioctl-test.c.o
[263/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-io-config.cpp.o
[264/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-subdevs.cpp.o
[265/309] Linking target contrib/test/ioctl-test
[266/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-media.cpp.o
[267/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-time32-64.cpp.o
[268/309] Compiling C object contrib/test/sliced-vbi-detect.p/sliced-vbi-detect.c.o
[269/309] Compiling C object contrib/test/sliced-vbi-test.p/sliced-vbi-test.c.o
[270/309] Compiling C object contrib/test/v4l2grab.p/v4l2grab.c.o
[271/309] Compiling C object contrib/test/driver-test.p/driver-test.c.o
[272/309] Linking target contrib/test/sliced-vbi-detect
[273/309] Linking target contrib/test/sliced-vbi-test
[274/309] Compiling C object contrib/test/mc-nextgen-test.p/mc_nextgen_test.c.o
[275/309] Linking target contrib/test/v4l2grab
[276/309] Linking target contrib/test/driver-test
[277/309] Compiling C object contrib/test/capture-example.p/capture-example.c.o
[278/309] Compiling C object contrib/test/stress-buffer.p/stress-buffer.c.o
[279/309] Linking target contrib/test/mc-nextgen-test
[280/309] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
[281/309] Linking target contrib/test/capture-example
[282/309] Compiling C object contrib/test/pixfmt-test.p/pixfmt-test.c.o
[283/309] Linking target contrib/test/stress-buffer
[284/309] Compiling C++ object utils/edid-decode/edid-decode.p/edid-decode.cpp.o
[285/309] Linking target contrib/test/pixfmt-test
[286/309] Linking target contrib/test/v4l2gl
[287/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/firmware-tool.c.o
[288/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/standards.c.o
[289/309] Compiling C object contrib/rds-saa6588/rds-saa6588.p/rds-saa6588.c.o
[290/309] Linking target contrib/xc3028-firmware/xc3028-firmware
[291/309] Compiling C object contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o
[292/309] Compiling C object contrib/decode_tm6000/decode_tm6000.p/decode_tm6000.c.o
[293/309] Linking target contrib/gconv/ARIB-STD-B24.so
[294/309] Linking target contrib/rds-saa6588/rds-saa6588
[295/309] Compiling C object contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o
[296/309] Linking target utils/edid-decode/edid-decode
[297/309] Linking target contrib/decode_tm6000/decode_tm6000
[298/309] Linking target contrib/gconv/EN300-468-TAB00.so
[299/309] Compiling C object contrib/test/sdlcam.p/sdlcam.c.o
[300/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
[301/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-compliance.cpp.o
[302/309] Linking target utils/cec-ctl/cec-ctl
[303/309] Linking target utils/cec-compliance/cec-compliance
[304/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl.cpp.o
[305/309] Linking target contrib/test/sdlcam
[306/309] Linking target utils/v4l2-ctl/v4l2-ctl
[307/309] Generating doc/doxygen with a custom command
<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/lib/include/libdvbv5/dvb-dev.h>:321: warning: argument 'open_dev' from the argument list of dvb_dev_get_fd has multiple @param documentation sections
[308/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-compliance.cpp.o
[309/309] Linking target utils/v4l2-compliance/v4l2-compliance
+ pwd
+ DVB_FORMAT_CONVERT=<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/build/utils/dvb/dvb-format-convert> make
Reading file dvb-s/Amazonas-3-61.0W
Writing file dvbv3/dvb-s/Amazonas-3-61.0W
Reading file dvb-s/Amazonas-2-61.0W
Writing file dvbv3/dvb-s/Amazonas-2-61.0W
Reading file dvb-s/Alcomsat-1-24.8W
Writing file dvbv3/dvb-s/Alcomsat-1-24.8W
Reading file dvb-s/ABS-2-75.0E
Writing file dvbv3/dvb-s/ABS-2-75.0E
Reading file dvb-s/ABS-2A-75.0E
Writing file dvbv3/dvb-s/ABS-2A-75.0E
Reading file dvb-s/Al-Yah-1-52.5E
Writing file dvbv3/dvb-s/Al-Yah-1-52.5E
Reading file dvb-s/ABS-6-159.0E
Writing file dvbv3/dvb-s/ABS-6-159.0E
Reading file dvb-s/ABS-3A-3.0W
Writing file dvbv3/dvb-s/ABS-3A-3.0W
Reading file dvb-s/AlComSat-1-24.5W
Writing file dvbv3/dvb-s/AlComSat-1-24.5W
Reading file dvb-s/Amazonas-36.2W
Writing file dvbv3/dvb-s/Amazonas-36.2W
Reading file dvb-s/Amazonas-5-61.0W
Writing file dvbv3/dvb-s/Amazonas-5-61.0W
Reading file dvb-s/Amos-17-17.0E
Writing file dvbv3/dvb-s/Amos-17-17.0E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 37 of dvb-s/Amos-4-65.0E
Error reading file dvb-s/Amos-4-65.0E
Reading file dvb-s/Amos-4-65.0E
make: *** [Makefile:49: dvbv3/dvb-s/Amos-4-65.0E] Error 255
make: *** Waiting for unfinished jobs....
Reading file dvb-s/Anik-F1R-107.3W
Writing file dvbv3/dvb-s/Anik-F1R-107.3W
Reading file dvb-s/Anik-F2-111.1W
Writing file dvbv3/dvb-s/Anik-F2-111.1W
Reading file dvb-s/Amos-3-4.0W
Writing file dvbv3/dvb-s/Amos-3-4.0W
Reading file dvb-s/Anik-F3-118.8W
Writing file dvbv3/dvb-s/Anik-F3-118.8W
Reading file dvb-s/Apstar-6C-134.0E
Writing file dvbv3/dvb-s/Apstar-6C-134.0E
Reading file dvb-s/Anik-F3-&-T8-&-EchoStar-14-119.0W
Writing file dvbv3/dvb-s/Anik-F3-&-T8-&-EchoStar-14-119.0W
Reading file dvb-s/Apstar-7-76.5E
Writing file dvbv3/dvb-s/Apstar-7-76.5E
Reading file dvb-s/Apstar-9-142.0E
Writing file dvbv3/dvb-s/Apstar-9-142.0E
Build step 'Execute shell' marked build as failure


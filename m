Return-Path: <linux-media+bounces-51795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIxnMmDce2noIwIAu9opvQ
	(envelope-from <linux-media+bounces-51795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 23:17:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC43B53A8
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 23:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3C5730164A0
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 22:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E765936A030;
	Thu, 29 Jan 2026 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="BkJaZDGr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A332AAC9
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725021; cv=pass; b=FgHIc2XDYOStCVdZrVYd2Kd0TVmFVAwRAPq8FJ4x1ZG41Bb2RjHRYr3oDm3U68sXlitZExZsc6fVSn13sTsFrUEZFxjvCxFU1ADijZVqDAbb/5fZipXcS/fpF5OUBjIIOhqhh5aorESbNL8gvUeuNIGePZdrWSnrHgz72nTuW84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725021; c=relaxed/simple;
	bh=rKpfLyUg18/0tGqyyiR+ZLgqRCc9INdxVuD1MD4sdKI=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=FCAegHeuDZijppyNB0lukc+0GkWzAQnypx7uYBxx/YY+hLf6rA8bof8z7F3vGUOOL/CmQaYgFYD6Ofh9G+KM0n3NNwuVuWBRmYWnmv37fLDUqZd1Fllwravr4hn4t+kqVuIOdcdM4V4bqbR0N50h13WzzADygca2DfkM2KbrQ3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=BkJaZDGr; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com [103.168.172.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tomi.juntunen@iki.fi)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4f2D5G13BCz49Pv9
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 00:16:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1769725011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3fUP7YFUkZnlakNSlat+wNsDkBoII15n9vEfnSWlhg=;
	b=BkJaZDGr7dxXuMBc8yAQT+ai33AtGszhqw5YTnQqDVyKypb+WDHfGJIp0rQK7JovwmZV9Z
	2riRWhZezu/4/X/V+D6LKgP8F7oePdlorgVgqiLakUX2i6N2ng8jKwN1M3H8kAHmTMx+Mg
	i4WbMykBZ4hoxm/fErbOfR7RzwGscZVYWyXq2LFGrBb1wYfsYRgc0yG52I0PSuN+bCEYrJ
	I96qq8H21oZ8sffJs/BpXatP+s127mdM4PtHK53nkdzztIpXFAcYyt2/LgKQ41kFpAlaLL
	DmHUjwjo2rrxy0KXZ6Dhfm8xqCBLA36LsLYMxZgSrViiAZuUMelAZq2ah+XBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1769725010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3fUP7YFUkZnlakNSlat+wNsDkBoII15n9vEfnSWlhg=;
	b=PIqI4WoIKEAgqJPupQgtf98PcIKngJ33RAh4sLi5RUMx6KQsPVHk8dtfkmVw0teGUCooS8
	PbHbeoVdTWZa4gYchsLhlku0ttYQtU4kmGIYyTEHCU9uFqcSsnkobyTsI7RBIz2s8k6EEO
	Z8MIAn0EKZMUmI2enUs2Niy4E5Pyzc1NLPyjN3dsUQelyCTJBkvkjoMuw+ZLaUDTIn9Z7E
	lXyLJCb8LRTmMgpSFRsTCPGBXJj1zQChLMSHZ4In5J7q4+TKJ1OQHphQt8nX5wD8zOYkf1
	wFbNmmd/8MdYJCDjarIgqwuYudW7dZwJHYNH6KSmnx8zgsJHLUANq0+Yfja4wQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1769725011;
	b=pzvfdamoJRDosYG2e5In0hr9k+rkPgLIZJNkoPAS445F/5+lns3O36pF07VzeFd55JwTtO
	czo5PmvD58W4e5vQp/q2TdnJXedbM88Kzqyt05hjzc7jgfHzUetCZyk+5bYEoRh53hAwf0
	wiWia8Xb1aqXWxhfJBzc1YxNRbo/DehdSWbnzpXjERG6vg/EYq98743H8X0QLblnVCiUYW
	Rap4GcxRL0SZWUn9+Xg4GIzPNTukfON+hGLIpHoPATjgsvOBX+Qu40h4ghPrwOYNwHM9GO
	1AR3t5qqjr/5I6jZglbIXEw4Azmpf6viC7jpFZrYhDnTPmdIzLWYh2Pfjt07GQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=tomi.juntunen@iki.fi smtp.mailfrom=tomi.juntunen@iki.fi
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8245AF40073
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 17:16:48 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-12.internal (MEProxy); Thu, 29 Jan 2026 17:16:48 -0500
X-ME-Sender: <xms:UNx7af7MKtJ6hmzzj-8KoxM_MSo-GcvBZTOhsy2z7LWbOmqKCp4_LQ>
    <xme:UNx7aftPHAq3ugrzUHjEeqL9bKLLly1lb4fW_Y0kL08GNX4S-qhMMepiT85soCNPC
    WbYIc_MPR346ulX8oATk8oMJdtt6w-qViDAq5mUSLvkwR0cuPuT2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieejfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpedfvfhomhhiucfluhhnthhunhgvnhdfuceothhomhhirdhjuhhnthhu
    nhgvnhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpeelffekfeeujeduieekvedvgf
    eukedufeetgeffudduudeuieektdeliefftdegfeenucffohhmrghinhepughighhithgr
    rdhfihenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    htohhmihhjuhhnthhunhgvnhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udehtdejkeehiedttddqfeduheeigeeikeekqdhtohhmihdrjhhunhhtuhhnvghnpeepih
    hkihdrfhhisehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UNx7acK4WIECgMmC15uQKR6XnSnuPu1lPCWgnR66NUQYd-jXq_lwKQ>
    <xmx:UNx7acF3EsDyIuVHOucSxHrzmjZmaT1uEJSWOKLdTJA8v_yTarvlwg>
    <xmx:UNx7aZlYhcSfNIDq0yL4Gw6ah9Zlfy1BZTpMFnd9tCkomWz3hJBufw>
    <xmx:UNx7aRIcF5f-q-kkrNX09C-jgKm-YOHtDYzDR7G8D4cP_Ai9G4RRRA>
    <xmx:UNx7aSYppqMg1Libtyo0TFR0Jxs0Co6ibuPCMD6M_cJljmS5pgKkgdqs>
Feedback-ID: ifb994952:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 523A13020081; Thu, 29 Jan 2026 17:16:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Jan 2026 00:16:26 +0200
From: "Tomi Juntunen" <tomi.juntunen@iki.fi>
To: linux-media@vger.kernel.org
Message-Id: <841987d4-40e5-496d-b2db-2ef5e4cad7ee@app.fastmail.com>
Subject: [PATCH] dvt-scan-tables: frequency updates for Finland
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51795-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.juntunen@iki.fi,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAC43B53A8
X-Rspamd-Action: no action

From e5c7eb50f1ea9904acef10bdfac293d304455dfa Mon Sep 17 00:00:00 2001
From: Tomi Juntunen <tomi.juntunen@iki.fi>
Date: Thu, 29 Jan 2026 23:54:54 +0200
Subject: [PATCH] dvt-scan-tables: frequency updates for Finland

All stations have moved to use DVB-T2 in 2025-03-31 for General Radio
and 2025-06-30 for commercial stations. Updated frequencies and
standard accordingly.

Signed-off-by: Tomi Juntunen <tomi.juntunen@iki.fi>
---
 dvb-t/fi-Aanekoski               | 19 ++++++++-----------
 dvb-t/fi-Aanekoski_Konginkangas  | 17 +++++++----------
 dvb-t/fi-Ahtari                  | 11 ++++-------
 dvb-t/fi-Alajarvi                | 19 ++++++++-----------
 dvb-t/fi-Anjalankoski_Ruotila    | 20 ++++++--------------
 dvb-t/fi-Enontekio_Ahovaara      | 11 ++++-------
 dvb-t/fi-Enontekio_Hetta         |  9 +++------
 dvb-t/fi-Enontekio_Kuttanen      |  4 +++-
 dvb-t/fi-Espoo                   | 29 ++++++++---------------------
 dvb-t/fi-Eurajoki                | 22 +++++++---------------
 dvb-t/fi-Fiskars                 | 30 +++++++++++-------------------
 dvb-t/fi-Haapavesi               | 29 ++++++++---------------------
 dvb-t/fi-Hameenkyro_Kyroskoski   | 17 +++++++----------
 dvb-t/fi-Hameenlinna_Painokangas | 14 ++++++++------
 dvb-t/fi-Hanko                   | 17 +++++++----------
 dvb-t/fi-Hartola                 | 12 +++++++-----
 dvb-t/fi-Heinavesi               | 14 ++++++++------
 dvb-t/fi-Heinola                 | 15 ++++++---------
 dvb-t/fi-Honkajoki_Teollisuustie | 20 ++++++++++++++++++++
 dvb-t/fi-Hyrynsalmi              | 10 ++++++----
 dvb-t/fi-Hyrynsalmi_Kyparavaara  | 10 ++++++----
 dvb-t/fi-Hyrynsalmi_Paljakka     | 12 +++++++-----
 dvb-t/fi-Hyvinkaa                | 21 +++++++++++----------
 dvb-t/fi-Ii_Raiskio              | 10 ++++++----
 dvb-t/fi-Iisalmi                 | 11 ++++-------
 dvb-t/fi-Ikaalinen               | 19 ++++++++-----------
 dvb-t/fi-Ikaalinen_Riitiala      | 17 +++++++----------
 dvb-t/fi-Inari                   |  9 +++------
 dvb-t/fi-Inari_Janispaa          |  9 +++------
 dvb-t/fi-Inari_Naatamo           |  9 +++------
 dvb-t/fi-Inari_Saarineitamovaara | 10 ++++++++++
 dvb-t/fi-Ivalo_Saarineitamovaara | 13 -------------
 dvb-t/fi-Jalasjarvi              | 17 +++++++----------
 dvb-t/fi-Jamsa_Halli             | 19 ++++++++-----------
 dvb-t/fi-Jamsa_Kaipola           | 19 ++++++++-----------
 dvb-t/fi-Jamsa_Matkosvuori       | 17 +++++++----------
 dvb-t/fi-Jamsa_Ouninpohja        | 14 ++++++++------
 dvb-t/fi-Jamsankoski             | 17 +++++++----------
 dvb-t/fi-Joensuu_Vestinkallio    | 12 +++++++-----
 dvb-t/fi-Joroinen_Puukkola       | 12 +++++++-----
 dvb-t/fi-Joutsa_Lankia           | 19 ++++++++-----------
 dvb-t/fi-Joutseno                | 24 ++++++++----------------
 dvb-t/fi-Juupajoki_Kopsamo       | 14 ++++++++------
 dvb-t/fi-Juva                    | 17 +++++++----------
 dvb-t/fi-Jyvaskyla               | 22 +++++++---------------
 dvb-t/fi-Jyvaskyla_Vaajakoski    | 12 +++++++-----
 dvb-t/fi-Kaavi_Sivakkavaara      | 12 +++++++-----
 dvb-t/fi-Kajaani_Pollyvaara      | 14 ++++++++------
 dvb-t/fi-Kalajoki                | 12 +++++++-----
 dvb-t/fi-Kangaslampi             | 17 +++++++----------
 dvb-t/fi-Kangasniemi_Turkinmaki  | 19 ++++++++-----------
 dvb-t/fi-Kankaanpaa              | 23 -----------------------
 dvb-t/fi-Kankaanpaa_Tapala       | 20 ++++++++++++++++++++
 dvb-t/fi-Karigasniemi            | 11 ++++-------
 dvb-t/fi-Karkkila                | 20 +++++++++++---------
 dvb-t/fi-Karstula                | 14 ++++++++------
 dvb-t/fi-Karvia                  | 15 ++++++---------
 dvb-t/fi-Kaunispaa               |  9 +++------
 dvb-t/fi-Kemi                    | 20 ++++++++++++++++++++
 dvb-t/fi-Kemijarvi_Suomutunturi  | 11 ++++-------
 dvb-t/fi-Kerimaki                | 15 ++++++---------
 dvb-t/fi-Keuruu                  | 23 -----------------------
 dvb-t/fi-Keuruu_Haapamaki        | 19 ++++++++-----------
 dvb-t/fi-Keuruu_Hantamaki        | 20 ++++++++++++++++++++
 dvb-t/fi-Kihnio                  | 19 ++++++++-----------
 dvb-t/fi-Kiihtelysvaara          | 11 ++++-------
 dvb-t/fi-Kilpisjarvi             |  7 ++-----
 dvb-t/fi-Kittila_Levitunturi     | 13 -------------
 dvb-t/fi-Kittila_Sirkka          | 10 ++++++++++
 dvb-t/fi-Kolari_Vuolittaja       | 11 ++++-------
 dvb-t/fi-Koli                    | 17 +++++++----------
 dvb-t/fi-Korpilahti_Vaarunvuori  | 17 +++++++----------
 dvb-t/fi-Korppoo                 | 15 ++++++---------
 dvb-t/fi-Kruunupyy               | 24 ++++++++----------------
 dvb-t/fi-Kuhmo_Haukela           | 12 +++++++-----
 dvb-t/fi-Kuhmo_Lentiira          | 10 ++++++----
 dvb-t/fi-Kuhmo_Niva              | 12 +++++++-----
 dvb-t/fi-Kuhmoinen               | 17 +++++++----------
 dvb-t/fi-Kuhmoinen_Harjunsalmi   | 19 ++++++++-----------
 dvb-t/fi-Kuhmoinen_Puukkoinen    | 12 +++++++-----
 dvb-t/fi-Kuopio                  | 22 +++++++---------------
 dvb-t/fi-Kurikka_Kesti           | 17 +++++++----------
 dvb-t/fi-Kurikka_Santavuori      | 20 ++++++++++++++++++++
 dvb-t/fi-Kustavi_Viherlahti      | 17 +++++++----------
 dvb-t/fi-Kuusamo_Hamppulampi     |  9 +++------
 dvb-t/fi-Kyyjarvi_Noposenaho     | 10 ++++++----
 dvb-t/fi-Lahti                   | 27 +++++++--------------------
 dvb-t/fi-Lapua                   | 26 +++++++++-----------------
 dvb-t/fi-Laukaa                  | 17 +++++++----------
 dvb-t/fi-Laukaa_Vihtavuori       | 17 +++++++----------
 dvb-t/fi-Lavia                   | 14 ++++++++------
 dvb-t/fi-Lohja                   | 21 +++++++++++----------
 dvb-t/fi-Loimaa                  | 19 ++++++++-----------
 dvb-t/fi-Luhanka                 | 17 +++++++----------
 dvb-t/fi-Luopioinen              | 19 ++++++++-----------
 dvb-t/fi-Mantta                  | 19 ++++++++-----------
 dvb-t/fi-Mantyharju              | 12 +++++++-----
 dvb-t/fi-Mikkeli                 | 17 +++++++----------
 dvb-t/fi-Muonio_Olostunturi      | 11 ++++-------
 dvb-t/fi-Nilsia                  | 17 +++++++----------
 dvb-t/fi-Nilsia_Keski-Siikajarvi | 12 +++++++-----
 dvb-t/fi-Nilsia_Pisa             | 10 ++++++----
 dvb-t/fi-Nokia                   | 21 +++++++++------------
 dvb-t/fi-Nokia_Siuro             | 21 +++++++++------------
 dvb-t/fi-Nummi-Pusula_Hoynola    | 20 ++++++++++++++++++++
 dvb-t/fi-Nummi-Pusula_Hyonola    | 23 -----------------------
 dvb-t/fi-Nuorgam_Njallavaara     |  9 +++------
 dvb-t/fi-Nuorgam_Raja            | 10 ++++++++++
 dvb-t/fi-Nuorgam_raja            | 13 -------------
 dvb-t/fi-Nurmes_Konnanvaara      | 17 +++++++----------
 dvb-t/fi-Nurmes_Kortevaara       |  8 +++++---
 dvb-t/fi-Orivesi_Talviainen      | 14 ++++++++------
 dvb-t/fi-Oulu                    | 29 ++++++++---------------------
 dvb-t/fi-Padasjoki               | 17 +++++++----------
 dvb-t/fi-Padasjoki_Arrakoski     | 19 ++++++++-----------
 dvb-t/fi-Paltamo_Kivesjarvi      | 20 ++++++++++++++++++++
 dvb-t/fi-Paltamo_Kivesvaara      | 18 ------------------
 dvb-t/fi-Parainen_Houtskari      | 15 ++++++---------
 dvb-t/fi-Parikkala               | 17 +++++++----------
 dvb-t/fi-Parkano_Sopukallio      | 17 +++++++----------
 dvb-t/fi-Pello                   | 11 ++++-------
 dvb-t/fi-Pello_Ratasvaara        | 10 ++++++----
 dvb-t/fi-Perho                   | 17 +++++++----------
 dvb-t/fi-Pernaja                 | 15 ++++++---------
 dvb-t/fi-Pieksamaki_Halkokumpu   | 14 ++++++++------
 dvb-t/fi-Pihtipudas              | 12 +++++++-----
 dvb-t/fi-Pori                    | 20 ++++++++++++++++++++
 dvb-t/fi-Porvoo_Suomenkyla       | 17 +++++++----------
 dvb-t/fi-Posio                   | 11 ++++-------
 dvb-t/fi-Pudasjarvi              | 10 ++++++----
 dvb-t/fi-Pudasjarvi_Iso-Syote    | 14 ++++++++------
 dvb-t/fi-Pudasjarvi_Kangasvaara  | 11 ++++-------
 dvb-t/fi-Pudasjarvi_Pauvankangas | 15 +++++++++++++++
 dvb-t/fi-Puolanka                | 17 +++++++----------
 dvb-t/fi-Pyhatunturi             |  9 +++------
 dvb-t/fi-Pyhavuori               | 11 ++++-------
 dvb-t/fi-Pylkonmaki_Karankajarvi | 10 ++++++----
 dvb-t/fi-Raahe_Mestauskallio     | 17 +++++++----------
 dvb-t/fi-Raahe_Piehinki          | 14 ++++++++------
 dvb-t/fi-Ranua_Haasiomaa         | 10 ++++++++++
 dvb-t/fi-Ranua_Haasionmaa        | 13 -------------
 dvb-t/fi-Ranua_Leppiaho          |  8 +++++---
 dvb-t/fi-Rautavaara_Angervikko   | 19 ++++++++-----------
 dvb-t/fi-Rautjarvi_Simpele       | 12 +++++++-----
 dvb-t/fi-Ristijarvi              | 10 ++++++----
 dvb-t/fi-Rovaniemi               | 13 +++++--------
 dvb-t/fi-Rovaniemi_Kaihuanvaara  | 11 ++++-------
 dvb-t/fi-Rovaniemi_Karhuvaara    | 11 ++++-------
 dvb-t/fi-Rovaniemi_Marasenkallio |  8 +++++---
 dvb-t/fi-Rovaniemi_Rantalaki     | 10 ++++++----
 dvb-t/fi-Rovaniemi_Sonka         |  8 +++++---
 dvb-t/fi-Rovaniemi_Sorvijarvi    | 15 +++++++++++++++
 dvb-t/fi-Rovaniemi_Sorviselka    | 13 -------------
 dvb-t/fi-Ruka                    | 13 +++++--------
 dvb-t/fi-Ruovesi_Storminiemi     | 17 +++++++----------
 dvb-t/fi-Saarijarvi              | 17 +++++++----------
 dvb-t/fi-Saarijarvi_Kalmari      | 10 ++++++----
 dvb-t/fi-Saarijarvi_Mahlu        | 14 ++++++++------
 dvb-t/fi-Salla_Hirvasvaara       | 11 ++++-------
 dvb-t/fi-Salla_Ihistysjanka      | 11 ++++-------
 dvb-t/fi-Salla_Naruska           | 11 ++++-------
 dvb-t/fi-Salla_Sallatunturi      | 11 ++++-------
 dvb-t/fi-Salla_Sarivaara         | 11 ++++-------
 dvb-t/fi-Salo_Isokyla            | 15 ++++++---------
 dvb-t/fi-Savukoski_Martti        | 11 ++++-------
 dvb-t/fi-Savukoski_Tanhua        | 11 ++++-------
 dvb-t/fi-Siilinjarvi             | 17 +++++++----------
 dvb-t/fi-Simo_Viantie            | 12 +++++++-----
 dvb-t/fi-Sipoo_Norrkulla         | 17 +++++++----------
 dvb-t/fi-Sodankyla_Pittiovaara   | 11 ++++-------
 dvb-t/fi-Sodankyla_Vuotso        | 11 ++++-------
 dvb-t/fi-Soini_Keisala           | 20 ++++++++++++++++++++
 dvb-t/fi-Sulkava_Vaatalanmaki    | 14 ++++++++------
 dvb-t/fi-Suomussalmi_Ala-Vuokki  | 11 ++++-------
 dvb-t/fi-Suomussalmi_Ammansaari  | 13 -------------
 dvb-t/fi-Suomussalmi_Juntusranta | 11 ++++-------
 dvb-t/fi-Suomussalmi_Myllylahti  | 11 ++++-------
 dvb-t/fi-Suomussalmi_ammansaari  | 10 ++++++++++
 dvb-t/fi-Sysma_Liikola           | 15 ++++++---------
 dvb-t/fi-Taivalkoski             |  9 +++------
 dvb-t/fi-Taivalkoski_Taivalvaara | 11 ++++-------
 dvb-t/fi-Tammela                 | 28 +++++++---------------------
 dvb-t/fi-Tammisaari              | 17 +++++++----------
 dvb-t/fi-Tampere                 | 20 ++++++++++++++++++++
 dvb-t/fi-Tampere_Pyynikki        | 27 +++++++--------------------
 dvb-t/fi-Tervola                 | 11 ++++-------
 dvb-t/fi-Turku                   | 27 +++++++--------------------
 dvb-t/fi-Utsjoki                 | 11 ++++-------
 dvb-t/fi-Utsjoki_Nuvvus          |  9 +++------
 dvb-t/fi-Utsjoki_Outakoski       | 11 ++++-------
 dvb-t/fi-Utsjoki_Polvarniemi     | 11 ++++-------
 dvb-t/fi-Utsjoki_Rovisuvanto     |  9 +++------
 dvb-t/fi-Utsjoki_Tenola          |  9 +++------
 dvb-t/fi-Uusikaupunki_Orivo      | 15 ++++++---------
 dvb-t/fi-Vaala                   | 14 ++++++++------
 dvb-t/fi-Vaasa                   | 13 +++++--------
 dvb-t/fi-Valtimo                 | 10 ++++++----
 dvb-t/fi-Vammala_Jyranvuori      | 19 ++++++++-----------
 dvb-t/fi-Vammala_Roismala        | 12 +++++++-----
 dvb-t/fi-Vammala_Savi            | 12 +++++++-----
 dvb-t/fi-Vantaa_Hakunila         | 12 +++++++-----
 dvb-t/fi-Varpaisjarvi_Honkamaki  | 19 ++++++++-----------
 dvb-t/fi-Virrat_Lappavuori       | 17 +++++++----------
 dvb-t/fi-Vuokatti                | 19 ++++++++-----------
 dvb-t/fi-Ylitornio_Ainiovaara    | 13 +++++--------
 dvb-t/fi-Ylitornio_Raanujarvi    | 10 ++++++----
 dvb-t/fi-Yllas                   | 11 ++++-------
 dvb-t/fi-Yllasjarvi              | 11 ++++-------
 208 files changed, 1410 insertions(+), 1681 deletions(-)
 create mode 100644 dvb-t/fi-Honkajoki_Teollisuustie
 create mode 100644 dvb-t/fi-Inari_Saarineitamovaara
 delete mode 100644 dvb-t/fi-Ivalo_Saarineitamovaara
 delete mode 100644 dvb-t/fi-Kankaanpaa
 create mode 100644 dvb-t/fi-Kankaanpaa_Tapala
 create mode 100644 dvb-t/fi-Kemi
 delete mode 100644 dvb-t/fi-Keuruu
 create mode 100644 dvb-t/fi-Keuruu_Hantamaki
 delete mode 100644 dvb-t/fi-Kittila_Levitunturi
 create mode 100644 dvb-t/fi-Kittila_Sirkka
 create mode 100644 dvb-t/fi-Kurikka_Santavuori
 create mode 100644 dvb-t/fi-Nummi-Pusula_Hoynola
 delete mode 100644 dvb-t/fi-Nummi-Pusula_Hyonola
 create mode 100644 dvb-t/fi-Nuorgam_Raja
 delete mode 100644 dvb-t/fi-Nuorgam_raja
 create mode 100644 dvb-t/fi-Paltamo_Kivesjarvi
 delete mode 100644 dvb-t/fi-Paltamo_Kivesvaara
 create mode 100644 dvb-t/fi-Pori
 create mode 100644 dvb-t/fi-Pudasjarvi_Pauvankangas
 create mode 100644 dvb-t/fi-Ranua_Haasiomaa
 delete mode 100644 dvb-t/fi-Ranua_Haasionmaa
 create mode 100644 dvb-t/fi-Rovaniemi_Sorvijarvi
 delete mode 100644 dvb-t/fi-Rovaniemi_Sorviselka
 create mode 100644 dvb-t/fi-Soini_Keisala
 delete mode 100644 dvb-t/fi-Suomussalmi_Ammansaari
 create mode 100644 dvb-t/fi-Suomussalmi_ammansaari
 create mode 100644 dvb-t/fi-Tampere

diff --git a/dvb-t/fi-Aanekoski b/dvb-t/fi-Aanekoski
index 7dda3262..83ff8d1b 100644
--- a/dvb-t/fi-Aanekoski
+++ b/dvb-t/fi-Aanekoski
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Aanekoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Aanekoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
-	BANDWIDTH_HZ = 8000000
-
-[Aanekoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Aanekoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Aanekoski_Konginkangas b/dvb-t/fi-Aanekoski_Konginkangas
index ff13741e..a193c18b 100644
--- a/dvb-t/fi-Aanekoski_Konginkangas
+++ b/dvb-t/fi-Aanekoski_Konginkangas
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Aanekoski_Konginkangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Aanekoski_Konginkangas]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Aanekoski_Konginkangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Aanekoski_Konginkangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ahtari b/dvb-t/fi-Ahtari
index aa90ea2d..e38a7efc 100644
--- a/dvb-t/fi-Ahtari
+++ b/dvb-t/fi-Ahtari
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ahtari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
-	BANDWIDTH_HZ = 8000000
-
-[Ahtari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Alajarvi b/dvb-t/fi-Alajarvi
index 712483d1..fbcb63d2 100644
--- a/dvb-t/fi-Alajarvi
+++ b/dvb-t/fi-Alajarvi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Alajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Alajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
-	BANDWIDTH_HZ = 8000000
-
-[Alajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Alajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Anjalankoski_Ruotila b/dvb-t/fi-Anjalankoski_Ruotila
index 4d3ab830..a17e65f7 100644
--- a/dvb-t/fi-Anjalankoski_Ruotila
+++ b/dvb-t/fi-Anjalankoski_Ruotila
@@ -1,27 +1,19 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Anjalankoski-A]
-	DELIVERY_SYSTEM = DVBT
+[Anjalankoski_Ruotila]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
-[Anjalankoski-B]
+[Anjalankoski_Ruotila]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Anjalankoski-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Anjalankoski-D]
-	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
-[Anjalankoski-E]
+[Anjalankoski_Ruotila]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/fi-Enontekio_Ahovaara b/dvb-t/fi-Enontekio_Ahovaara
index 21abdbc0..272bce30 100644
--- a/dvb-t/fi-Enontekio_Ahovaara
+++ b/dvb-t/fi-Enontekio_Ahovaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Enontekio_Ahovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Enontekio_Ahovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Enontekio_Hetta b/dvb-t/fi-Enontekio_Hetta
index 6ff6b845..6f27d87e 100644
--- a/dvb-t/fi-Enontekio_Hetta
+++ b/dvb-t/fi-Enontekio_Hetta
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Enontekio_Hetta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
-[Enontekio_Hetta]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Enontekio_Kuttanen b/dvb-t/fi-Enontekio_Kuttanen
index a792d59b..1d05578c 100644
--- a/dvb-t/fi-Enontekio_Kuttanen
+++ b/dvb-t/fi-Enontekio_Kuttanen
@@ -1,8 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Enontekio_Kuttanen]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Espoo b/dvb-t/fi-Espoo
index 02363260..64297813 100644
--- a/dvb-t/fi-Espoo
+++ b/dvb-t/fi-Espoo
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Espoo-A]
-	DELIVERY_SYSTEM = DVBT
+[Espoo]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Espoo-B]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 658000000
-        BANDWIDTH_HZ = 8000000
-
-[Espoo-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Espoo-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 650000000
-        BANDWIDTH_HZ = 8000000
-
-[Espoo-E]
-	DELIVERY_SYSTEM = DVBT
+[Espoo]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
-[Espoo-F]
+[Espoo]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 618000000
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Eurajoki b/dvb-t/fi-Eurajoki
index 2ccc418b..bf4f5c47 100644
--- a/dvb-t/fi-Eurajoki
+++ b/dvb-t/fi-Eurajoki
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Eurajoki-A]
-	DELIVERY_SYSTEM = DVBT
+[Eurajoki]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
-[Eurajoki-B]
+[Eurajoki]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Eurajoki-C]
-	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
-[Eurajoki-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
-	BANDWIDTH_HZ = 8000000
-
-[Eurajoki-F]
+[Eurajoki]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 570000000
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Fiskars b/dvb-t/fi-Fiskars
index 26561e3d..b445d905 100644
--- a/dvb-t/fi-Fiskars
+++ b/dvb-t/fi-Fiskars
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Fiskars-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+[Fiskars]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
-[Fiskars-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Fiskars-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 650000000
-        BANDWIDTH_HZ = 8000000
-
-[Fiskars-E]
-	DELIVERY_SYSTEM = DVBT
+[Fiskars]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
-[Fiskars-F]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 490000000
-        BANDWIDTH_HZ = 8000000
+[Fiskars]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
+	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Haapavesi b/dvb-t/fi-Haapavesi
index 265f976e..6031982a 100644
--- a/dvb-t/fi-Haapavesi
+++ b/dvb-t/fi-Haapavesi
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Haapavesi-A]
-	DELIVERY_SYSTEM = DVBT
+[Haapavesi]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi-B]
+[Haapavesi]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 642000000
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi-C]
-        DELIVERY_SYSTEM = DVBT
-        FREQUENCY = 658000000
-        BANDWIDTH_HZ = 8000000
-
-[Haapavesi-D]
+[Haapavesi]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 626000000
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
-	BANDWIDTH_HZ = 8000000
-
-[Haapavesi-F]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 570000000
-        BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Hameenkyro_Kyroskoski b/dvb-t/fi-Hameenkyro_Kyroskoski
index 8a98791c..c8fe2bd4 100644
--- a/dvb-t/fi-Hameenkyro_Kyroskoski
+++ b/dvb-t/fi-Hameenkyro_Kyroskoski
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hameenkyro_Kyroskoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
-	BANDWIDTH_HZ = 8000000
-
-[Hameenkyro_Kyroskoski]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Hameenkyro_Kyroskoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Hameenkyro_Kyroskoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Hameenlinna_Painokangas b/dvb-t/fi-Hameenlinna_Painokangas
index 9a56b2bb..b0f8b521 100644
--- a/dvb-t/fi-Hameenlinna_Painokangas
+++ b/dvb-t/fi-Hameenlinna_Painokangas
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hameenlinna_Painokangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Hameenlinna_Painokangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Hameenlinna_Painokangas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Hanko b/dvb-t/fi-Hanko
index ab08a142..8eded272 100644
--- a/dvb-t/fi-Hanko
+++ b/dvb-t/fi-Hanko
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hanko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Hanko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Hanko]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
-[Hanko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Hartola b/dvb-t/fi-Hartola
index d10df22d..5b4c3e0f 100644
--- a/dvb-t/fi-Hartola
+++ b/dvb-t/fi-Hartola
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hartola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Hartola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Hartola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Heinavesi b/dvb-t/fi-Heinavesi
index b33bb39e..403ea7e2 100644
--- a/dvb-t/fi-Heinavesi
+++ b/dvb-t/fi-Heinavesi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Heinavesi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Heinavesi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Heinavesi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Heinola b/dvb-t/fi-Heinola
index 7a6f234e..b2453660 100644
--- a/dvb-t/fi-Heinola
+++ b/dvb-t/fi-Heinola
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Heinola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Heinola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
-	BANDWIDTH_HZ = 8000000
-
-[Heinola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Heinola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Honkajoki_Teollisuustie b/dvb-t/fi-Honkajoki_Teollisuustie
new file mode 100644
index 00000000..88dc7715
--- /dev/null
+++ b/dvb-t/fi-Honkajoki_Teollisuustie
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Honkajoki_Teollisuustie]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 546000000
+	BANDWIDTH_HZ = 8000000
+
+[Honkajoki_Teollisuustie]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
+	BANDWIDTH_HZ = 8000000
+
+[Honkajoki_Teollisuustie]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Hyrynsalmi b/dvb-t/fi-Hyrynsalmi
index e11f89ac..52429323 100644
--- a/dvb-t/fi-Hyrynsalmi
+++ b/dvb-t/fi-Hyrynsalmi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hyrynsalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Hyrynsalmi_Kyparavaara b/dvb-t/fi-Hyrynsalmi_Kyparavaara
index f402d8af..79d75a5c 100644
--- a/dvb-t/fi-Hyrynsalmi_Kyparavaara
+++ b/dvb-t/fi-Hyrynsalmi_Kyparavaara
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hyrynsalmi_Kyparavaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi_Kyparavaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi_Kyparavaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Hyrynsalmi_Paljakka b/dvb-t/fi-Hyrynsalmi_Paljakka
index 806a3c09..8d61ea7b 100644
--- a/dvb-t/fi-Hyrynsalmi_Paljakka
+++ b/dvb-t/fi-Hyrynsalmi_Paljakka
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Hyrynsalmi_Paljakka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi_Paljakka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Hyrynsalmi_Paljakka]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Hyvinkaa b/dvb-t/fi-Hyvinkaa
index 25b77d1e..1b8de8c4 100644
--- a/dvb-t/fi-Hyvinkaa
+++ b/dvb-t/fi-Hyvinkaa
@@ -1,18 +1,19 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Hyvinkaa-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
+[Hyvinkaa]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Hyvinkaa-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Hyvinkaa-E]
-	DELIVERY_SYSTEM = DVBT
+[Hyvinkaa]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
+[Hyvinkaa]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
+	BANDWIDTH_HZ = 8000000
\ No newline at end of file
diff --git a/dvb-t/fi-Ii_Raiskio b/dvb-t/fi-Ii_Raiskio
index c5fda678..b06878f9 100644
--- a/dvb-t/fi-Ii_Raiskio
+++ b/dvb-t/fi-Ii_Raiskio
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ii_Raiskio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Ii_Raiskio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Iisalmi b/dvb-t/fi-Iisalmi
index d2818251..f5ee7787 100644
--- a/dvb-t/fi-Iisalmi
+++ b/dvb-t/fi-Iisalmi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Iisalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Iisalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ikaalinen b/dvb-t/fi-Ikaalinen
index 885d44b5..321ee383 100644
--- a/dvb-t/fi-Ikaalinen
+++ b/dvb-t/fi-Ikaalinen
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ikaalinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Ikaalinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Ikaalinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Ikaalinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ikaalinen_Riitiala b/dvb-t/fi-Ikaalinen_Riitiala
index 55d82022..849381bb 100644
--- a/dvb-t/fi-Ikaalinen_Riitiala
+++ b/dvb-t/fi-Ikaalinen_Riitiala
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ikaalinen_Riitiala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Ikaalinen_Riitiala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 738000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Ikaalinen_Riitiala]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
-[Ikaalinen_Riitiala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Inari b/dvb-t/fi-Inari
index 31deb212..cf253a5e 100644
--- a/dvb-t/fi-Inari
+++ b/dvb-t/fi-Inari
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Inari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
-	BANDWIDTH_HZ = 8000000
-
-[Inari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Inari_Janispaa b/dvb-t/fi-Inari_Janispaa
index 37bd31e2..766105a0 100644
--- a/dvb-t/fi-Inari_Janispaa
+++ b/dvb-t/fi-Inari_Janispaa
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Inari_Janispaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
-	BANDWIDTH_HZ = 8000000
-
-[Inari_Janispaa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Inari_Naatamo b/dvb-t/fi-Inari_Naatamo
index ba843609..3b36769e 100644
--- a/dvb-t/fi-Inari_Naatamo
+++ b/dvb-t/fi-Inari_Naatamo
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Inari_Naatamo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
-[Inari_Naatamo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Inari_Saarineitamovaara b/dvb-t/fi-Inari_Saarineitamovaara
new file mode 100644
index 00000000..588bfd50
--- /dev/null
+++ b/dvb-t/fi-Inari_Saarineitamovaara
@@ -0,0 +1,10 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Inari_Saarineitamovaara]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Ivalo_Saarineitamovaara b/dvb-t/fi-Ivalo_Saarineitamovaara
deleted file mode 100644
index 70181bbe..00000000
--- a/dvb-t/fi-Ivalo_Saarineitamovaara
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Ivalo_Saarineitamovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
-	BANDWIDTH_HZ = 8000000
-
-[Ivalo_Saarineitamovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Jalasjarvi b/dvb-t/fi-Jalasjarvi
index 9bc70582..c745e277 100644
--- a/dvb-t/fi-Jalasjarvi
+++ b/dvb-t/fi-Jalasjarvi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jalasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
-[Jalasjarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Jalasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
 [Jalasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jamsa_Halli b/dvb-t/fi-Jamsa_Halli
index 5d06520a..ec12f6e7 100644
--- a/dvb-t/fi-Jamsa_Halli
+++ b/dvb-t/fi-Jamsa_Halli
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jamsa_Halli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Halli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
-	BANDWIDTH_HZ = 8000000
-
-[Jamsa_Halli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Halli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jamsa_Kaipola b/dvb-t/fi-Jamsa_Kaipola
index ca8e563f..605f6527 100644
--- a/dvb-t/fi-Jamsa_Kaipola
+++ b/dvb-t/fi-Jamsa_Kaipola
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jamsa_Kaipola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Kaipola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Jamsa_Kaipola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Kaipola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jamsa_Matkosvuori b/dvb-t/fi-Jamsa_Matkosvuori
index eacacff3..7674ff41 100644
--- a/dvb-t/fi-Jamsa_Matkosvuori
+++ b/dvb-t/fi-Jamsa_Matkosvuori
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jamsa_Matkosvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Matkosvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Matkosvuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
-[Jamsa_Matkosvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Jamsa_Ouninpohja b/dvb-t/fi-Jamsa_Ouninpohja
index 70eb8e14..2f267514 100644
--- a/dvb-t/fi-Jamsa_Ouninpohja
+++ b/dvb-t/fi-Jamsa_Ouninpohja
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jamsa_Ouninpohja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Ouninpohja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsa_Ouninpohja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jamsankoski b/dvb-t/fi-Jamsankoski
index 142be917..05e57b48 100644
--- a/dvb-t/fi-Jamsankoski
+++ b/dvb-t/fi-Jamsankoski
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jamsankoski]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsankoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Jamsankoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-
-[Jamsankoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Joensuu_Vestinkallio b/dvb-t/fi-Joensuu_Vestinkallio
index 765ba1ce..8da65fd8 100644
--- a/dvb-t/fi-Joensuu_Vestinkallio
+++ b/dvb-t/fi-Joensuu_Vestinkallio
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Joensuu_Vestinkallio]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Joensuu_Vestinkallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Joensuu_Vestinkallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Joroinen_Puukkola b/dvb-t/fi-Joroinen_Puukkola
index 5fce8db4..c8c5f09f 100644
--- a/dvb-t/fi-Joroinen_Puukkola
+++ b/dvb-t/fi-Joroinen_Puukkola
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Joroinen_Puukkola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Joroinen_Puukkola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Joroinen_Puukkola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Joutsa_Lankia b/dvb-t/fi-Joutsa_Lankia
index cc44c813..9a545d37 100644
--- a/dvb-t/fi-Joutsa_Lankia
+++ b/dvb-t/fi-Joutsa_Lankia
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Joutsa_Lankia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Joutsa_Lankia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
 [Joutsa_Lankia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Joutsa_Lankia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Joutseno b/dvb-t/fi-Joutseno
index 0bde1b76..e2b12109 100644
--- a/dvb-t/fi-Joutseno
+++ b/dvb-t/fi-Joutseno
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Joutseno-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Joutseno-B]
+[Joutseno]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 658000000
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
-[Joutseno-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Joutseno-E]
-	DELIVERY_SYSTEM = DVBT
+[Joutseno]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Joutseno-F]
+[Joutseno]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 634000000
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Juupajoki_Kopsamo b/dvb-t/fi-Juupajoki_Kopsamo
index a99af77e..3b596fd9 100644
--- a/dvb-t/fi-Juupajoki_Kopsamo
+++ b/dvb-t/fi-Juupajoki_Kopsamo
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Juupajoki_Kopsamo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Juupajoki_Kopsamo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Juupajoki_Kopsamo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Juva b/dvb-t/fi-Juva
index ab8a15e5..396d65c4 100644
--- a/dvb-t/fi-Juva
+++ b/dvb-t/fi-Juva
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Juva]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
-	BANDWIDTH_HZ = 8000000
-
-[Juva]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Juva]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Juva]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jyvaskyla b/dvb-t/fi-Jyvaskyla
index 287792e4..d00c67ae 100644
--- a/dvb-t/fi-Jyvaskyla
+++ b/dvb-t/fi-Jyvaskyla
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Jyvaskyla-A]
-	DELIVERY_SYSTEM = DVBT
+[Jyvaskyla]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
-[Jyvaskyla-B]
+[Jyvaskyla]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
-[Jyvaskyla-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Jyvaskyla-E]
-	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
-[Jyvaskyla-F]
+[Jyvaskyla]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 634000000
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Jyvaskyla_Vaajakoski b/dvb-t/fi-Jyvaskyla_Vaajakoski
index 92b5ac96..95b93b4c 100644
--- a/dvb-t/fi-Jyvaskyla_Vaajakoski
+++ b/dvb-t/fi-Jyvaskyla_Vaajakoski
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Jyvaskyla_Vaajakoski]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Jyvaskyla_Vaajakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Jyvaskyla_Vaajakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kaavi_Sivakkavaara b/dvb-t/fi-Kaavi_Sivakkavaara
index 7595a398..c43011a5 100644
--- a/dvb-t/fi-Kaavi_Sivakkavaara
+++ b/dvb-t/fi-Kaavi_Sivakkavaara
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kaavi_Sivakkavaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Kaavi_Sivakkavaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Kaavi_Sivakkavaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kajaani_Pollyvaara b/dvb-t/fi-Kajaani_Pollyvaara
index 3ea7b90f..1c5f4974 100644
--- a/dvb-t/fi-Kajaani_Pollyvaara
+++ b/dvb-t/fi-Kajaani_Pollyvaara
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kajaani_Pollyvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Kajaani_Pollyvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Kajaani_Pollyvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kalajoki b/dvb-t/fi-Kalajoki
index cab796dc..5440d220 100644
--- a/dvb-t/fi-Kalajoki
+++ b/dvb-t/fi-Kalajoki
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kalajoki]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Kalajoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Kalajoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kangaslampi b/dvb-t/fi-Kangaslampi
index d84b2a9e..1e580f93 100644
--- a/dvb-t/fi-Kangaslampi
+++ b/dvb-t/fi-Kangaslampi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kangaslampi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Kangaslampi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
 [Kangaslampi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
-[Kangaslampi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Kangasniemi_Turkinmaki b/dvb-t/fi-Kangasniemi_Turkinmaki
index 56476e6b..03c2f14b 100644
--- a/dvb-t/fi-Kangasniemi_Turkinmaki
+++ b/dvb-t/fi-Kangasniemi_Turkinmaki
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kangasniemi_Turkinmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Kangasniemi_Turkinmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Kangasniemi_Turkinmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Kangasniemi_Turkinmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kankaanpaa b/dvb-t/fi-Kankaanpaa
deleted file mode 100644
index a3df7ba5..00000000
--- a/dvb-t/fi-Kankaanpaa
+++ /dev/null
@@ -1,23 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Kankaanpaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
-	BANDWIDTH_HZ = 8000000
-
-[Kankaanpaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Kankaanpaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Kankaanpaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Kankaanpaa_Tapala b/dvb-t/fi-Kankaanpaa_Tapala
new file mode 100644
index 00000000..49ba1db9
--- /dev/null
+++ b/dvb-t/fi-Kankaanpaa_Tapala
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Kankaanpaa_Tapala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
+	BANDWIDTH_HZ = 8000000
+
+[Kankaanpaa_Tapala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
+	BANDWIDTH_HZ = 8000000
+
+[Kankaanpaa_Tapala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Karigasniemi b/dvb-t/fi-Karigasniemi
index 60548c72..704dd030 100644
--- a/dvb-t/fi-Karigasniemi
+++ b/dvb-t/fi-Karigasniemi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Karigasniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Karigasniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Karkkila b/dvb-t/fi-Karkkila
index 7baeef4d..46ec0779 100644
--- a/dvb-t/fi-Karkkila
+++ b/dvb-t/fi-Karkkila
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Karkkila-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 666000000
+[Karkkila]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Karkkila-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+[Karkkila]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
-[Karkkila-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+[Karkkila]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Karstula b/dvb-t/fi-Karstula
index dfd30016..b011ab44 100644
--- a/dvb-t/fi-Karstula
+++ b/dvb-t/fi-Karstula
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Karstula]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Karstula]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Karstula]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Karvia b/dvb-t/fi-Karvia
index 51e89b7b..1189af23 100644
--- a/dvb-t/fi-Karvia
+++ b/dvb-t/fi-Karvia
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Karvia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Karvia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
-	BANDWIDTH_HZ = 8000000
-
-[Karvia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kaunispaa b/dvb-t/fi-Kaunispaa
index e9fea9c7..588168a2 100644
--- a/dvb-t/fi-Kaunispaa
+++ b/dvb-t/fi-Kaunispaa
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kaunispaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
-	BANDWIDTH_HZ = 8000000
-
-[Kaunispaa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kemi b/dvb-t/fi-Kemi
new file mode 100644
index 00000000..55e06315
--- /dev/null
+++ b/dvb-t/fi-Kemi
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Kemi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
+	BANDWIDTH_HZ = 8000000
+
+[Kemi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
+	BANDWIDTH_HZ = 8000000
+
+[Kemi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Kemijarvi_Suomutunturi b/dvb-t/fi-Kemijarvi_Suomutunturi
index dac5d932..d095166c 100644
--- a/dvb-t/fi-Kemijarvi_Suomutunturi
+++ b/dvb-t/fi-Kemijarvi_Suomutunturi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kemijarvi_Suomutunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
-	BANDWIDTH_HZ = 8000000
-
-[Kemijarvi_Suomutunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kerimaki b/dvb-t/fi-Kerimaki
index 68f45d10..15e85c7f 100644
--- a/dvb-t/fi-Kerimaki
+++ b/dvb-t/fi-Kerimaki
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kerimaki]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Kerimaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
 [Kerimaki]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
-[Kerimaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Keuruu b/dvb-t/fi-Keuruu
deleted file mode 100644
index dd49b5b6..00000000
--- a/dvb-t/fi-Keuruu
+++ /dev/null
@@ -1,23 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Keuruu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Keuruu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Keuruu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
-	BANDWIDTH_HZ = 8000000
-
-[Keuruu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Keuruu_Haapamaki b/dvb-t/fi-Keuruu_Haapamaki
index cfb9b0e2..cdab3264 100644
--- a/dvb-t/fi-Keuruu_Haapamaki
+++ b/dvb-t/fi-Keuruu_Haapamaki
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Keuruu_Haapamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Keuruu_Haapamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
-	BANDWIDTH_HZ = 8000000
-
-[Keuruu_Haapamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
 [Keuruu_Haapamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Keuruu_Hantamaki b/dvb-t/fi-Keuruu_Hantamaki
new file mode 100644
index 00000000..bbc030e2
--- /dev/null
+++ b/dvb-t/fi-Keuruu_Hantamaki
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Keuruu_Hantamaki]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
+	BANDWIDTH_HZ = 8000000
+
+[Keuruu_Hantamaki]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
+	BANDWIDTH_HZ = 8000000
+
+[Keuruu_Hantamaki]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Kihnio b/dvb-t/fi-Kihnio
index 7c5c9924..c2918ecb 100644
--- a/dvb-t/fi-Kihnio
+++ b/dvb-t/fi-Kihnio
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kihnio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 738000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Kihnio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Kihnio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Kihnio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kiihtelysvaara b/dvb-t/fi-Kiihtelysvaara
index 52e60b8e..4c80da0b 100644
--- a/dvb-t/fi-Kiihtelysvaara
+++ b/dvb-t/fi-Kiihtelysvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kiihtelysvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Kiihtelysvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kilpisjarvi b/dvb-t/fi-Kilpisjarvi
index b57fff29..f7755908 100644
--- a/dvb-t/fi-Kilpisjarvi
+++ b/dvb-t/fi-Kilpisjarvi
@@ -1,10 +1,7 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Kilpisjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 666000000
-	BANDWIDTH_HZ = 8000000
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kilpisjarvi]
 	DELIVERY_SYSTEM = DVBT2
diff --git a/dvb-t/fi-Kittila_Levitunturi b/dvb-t/fi-Kittila_Levitunturi
deleted file mode 100644
index ae4c1c90..00000000
--- a/dvb-t/fi-Kittila_Levitunturi
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Kittila_Levitunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Kittila_Levitunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Kittila_Sirkka b/dvb-t/fi-Kittila_Sirkka
new file mode 100644
index 00000000..a4bbe587
--- /dev/null
+++ b/dvb-t/fi-Kittila_Sirkka
@@ -0,0 +1,10 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Kittila_Sirkka]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Kolari_Vuolittaja b/dvb-t/fi-Kolari_Vuolittaja
index f507750a..5df4b764 100644
--- a/dvb-t/fi-Kolari_Vuolittaja
+++ b/dvb-t/fi-Kolari_Vuolittaja
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kolari_Vuolittaja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Kolari_Vuolittaja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Koli b/dvb-t/fi-Koli
index 034bf2d4..af39e46a 100644
--- a/dvb-t/fi-Koli
+++ b/dvb-t/fi-Koli
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Koli]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
 [Koli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Koli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Koli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Korpilahti_Vaarunvuori b/dvb-t/fi-Korpilahti_Vaarunvuori
index 7fa3ed65..56030c74 100644
--- a/dvb-t/fi-Korpilahti_Vaarunvuori
+++ b/dvb-t/fi-Korpilahti_Vaarunvuori
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Korpilahti_Vaarunvuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Korpilahti_Vaarunvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Korpilahti_Vaarunvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-
-[Korpilahti_Vaarunvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Korppoo b/dvb-t/fi-Korppoo
index 6c842414..a48db84d 100644
--- a/dvb-t/fi-Korppoo
+++ b/dvb-t/fi-Korppoo
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Korppoo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Korppoo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Korppoo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Korppoo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Kruunupyy b/dvb-t/fi-Kruunupyy
index ef91e8d5..0a6ea61f 100644
--- a/dvb-t/fi-Kruunupyy
+++ b/dvb-t/fi-Kruunupyy
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Kruunupyy-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Kruunupyy-B]
+[Kruunupyy]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 626000000
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
-[Kruunupyy-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
-	BANDWIDTH_HZ = 8000000
-
-[Kruunupyy-E]
-	DELIVERY_SYSTEM = DVBT
+[Kruunupyy]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
-[Kruunupyy-F]
+[Kruunupyy]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 506000000
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmo_Haukela b/dvb-t/fi-Kuhmo_Haukela
index c3a3bd8b..023fa08e 100644
--- a/dvb-t/fi-Kuhmo_Haukela
+++ b/dvb-t/fi-Kuhmo_Haukela
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmo_Haukela]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Haukela]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Haukela]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 586000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmo_Lentiira b/dvb-t/fi-Kuhmo_Lentiira
index 11279993..e55ec6ce 100644
--- a/dvb-t/fi-Kuhmo_Lentiira
+++ b/dvb-t/fi-Kuhmo_Lentiira
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmo_Lentiira]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Lentiira]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Lentiira]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmo_Niva b/dvb-t/fi-Kuhmo_Niva
index 6f7aa2cb..121b0f50 100644
--- a/dvb-t/fi-Kuhmo_Niva
+++ b/dvb-t/fi-Kuhmo_Niva
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmo_Niva]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Niva]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmo_Niva]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmoinen b/dvb-t/fi-Kuhmoinen
index 53d2de9e..cd2e9269 100644
--- a/dvb-t/fi-Kuhmoinen
+++ b/dvb-t/fi-Kuhmoinen
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmoinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Kuhmoinen]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmoinen_Harjunsalmi b/dvb-t/fi-Kuhmoinen_Harjunsalmi
index 059df911..f1beada0 100644
--- a/dvb-t/fi-Kuhmoinen_Harjunsalmi
+++ b/dvb-t/fi-Kuhmoinen_Harjunsalmi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmoinen_Harjunsalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen_Harjunsalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
-[Kuhmoinen_Harjunsalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen_Harjunsalmi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuhmoinen_Puukkoinen b/dvb-t/fi-Kuhmoinen_Puukkoinen
index 113e0f45..3b01984d 100644
--- a/dvb-t/fi-Kuhmoinen_Puukkoinen
+++ b/dvb-t/fi-Kuhmoinen_Puukkoinen
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuhmoinen_Puukkoinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen_Puukkoinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Kuhmoinen_Puukkoinen]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuopio b/dvb-t/fi-Kuopio
index ae9d0f2c..03ad46c7 100644
--- a/dvb-t/fi-Kuopio
+++ b/dvb-t/fi-Kuopio
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Kuopio-A]
-	DELIVERY_SYSTEM = DVBT
+[Kuopio]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
-[Kuopio-B]
+[Kuopio]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Kuopio-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
-	BANDWIDTH_HZ = 8000000
-
-[Kuopio-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Kuopio-F]
+[Kuopio]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 634000000
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kurikka_Kesti b/dvb-t/fi-Kurikka_Kesti
index c34cfe62..82ac81d3 100644
--- a/dvb-t/fi-Kurikka_Kesti
+++ b/dvb-t/fi-Kurikka_Kesti
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kurikka_Kesti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Kurikka_Kesti]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Kurikka_Kesti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Kurikka_Kesti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kurikka_Santavuori b/dvb-t/fi-Kurikka_Santavuori
new file mode 100644
index 00000000..e2fb08e5
--- /dev/null
+++ b/dvb-t/fi-Kurikka_Santavuori
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Kurikka_Santavuori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
+	BANDWIDTH_HZ = 8000000
+
+[Kurikka_Santavuori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
+	BANDWIDTH_HZ = 8000000
+
+[Kurikka_Santavuori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Kustavi_Viherlahti b/dvb-t/fi-Kustavi_Viherlahti
index 98404018..40cf98b6 100644
--- a/dvb-t/fi-Kustavi_Viherlahti
+++ b/dvb-t/fi-Kustavi_Viherlahti
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kustavi_Viherlahti]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Kustavi_Viherlahti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Kustavi_Viherlahti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
 [Kustavi_Viherlahti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kuusamo_Hamppulampi b/dvb-t/fi-Kuusamo_Hamppulampi
index 6ce9243a..7f58c0ab 100644
--- a/dvb-t/fi-Kuusamo_Hamppulampi
+++ b/dvb-t/fi-Kuusamo_Hamppulampi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kuusamo_Hamppulampi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Kuusamo_Hamppulampi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Kyyjarvi_Noposenaho b/dvb-t/fi-Kyyjarvi_Noposenaho
index d3deab81..53e3ce96 100644
--- a/dvb-t/fi-Kyyjarvi_Noposenaho
+++ b/dvb-t/fi-Kyyjarvi_Noposenaho
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Kyyjarvi_Noposenaho]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Kyyjarvi_Noposenaho]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
 [Kyyjarvi_Noposenaho]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Lahti b/dvb-t/fi-Lahti
index a632cf43..5bdbd395 100644
--- a/dvb-t/fi-Lahti
+++ b/dvb-t/fi-Lahti
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Lahti-A]
-	DELIVERY_SYSTEM = DVBT
+[Lahti]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
-[Lahti-B]
+[Lahti]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Lahti-C]
-	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
-[Lahti-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 602000000
-        BANDWIDTH_HZ = 8000000
-
-[Lahti-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
-	BANDWIDTH_HZ = 8000000
-
-[Lahti-F]
+[Lahti]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 642000000
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Lapua b/dvb-t/fi-Lapua
index cb982f1f..a8134f03 100644
--- a/dvb-t/fi-Lapua
+++ b/dvb-t/fi-Lapua
@@ -1,28 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Lapua-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
-	BANDWIDTH_HZ = 8000000
-
-[Lapua-B]
+[Lapua]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
-[Lapua-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
-[Lapua-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+[Lapua]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
-[Lapua-F]
+[Lapua]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 506000000
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Laukaa b/dvb-t/fi-Laukaa
index 3c484aeb..e9b86a77 100644
--- a/dvb-t/fi-Laukaa
+++ b/dvb-t/fi-Laukaa
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Laukaa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Laukaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Laukaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-
-[Laukaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Laukaa_Vihtavuori b/dvb-t/fi-Laukaa_Vihtavuori
index 5bc93a78..1c691651 100644
--- a/dvb-t/fi-Laukaa_Vihtavuori
+++ b/dvb-t/fi-Laukaa_Vihtavuori
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Laukaa_Vihtavuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Laukaa_Vihtavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Laukaa_Vihtavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-
-[Laukaa_Vihtavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Lavia b/dvb-t/fi-Lavia
index f2f13916..252dd34f 100644
--- a/dvb-t/fi-Lavia
+++ b/dvb-t/fi-Lavia
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Lavia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Lavia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Lavia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Lohja b/dvb-t/fi-Lohja
index 7952ddf3..4184e860 100644
--- a/dvb-t/fi-Lohja
+++ b/dvb-t/fi-Lohja
@@ -1,19 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Lohja-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+[Lohja]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Lohja-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Lohja-E]
-	DELIVERY_SYSTEM = DVBT
+[Lohja]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
+[Lohja]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
+	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Loimaa b/dvb-t/fi-Loimaa
index 0b6aad87..1a557b6a 100644
--- a/dvb-t/fi-Loimaa
+++ b/dvb-t/fi-Loimaa
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Loimaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Loimaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Loimaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Loimaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Luhanka b/dvb-t/fi-Luhanka
index f6407ce3..7044391b 100644
--- a/dvb-t/fi-Luhanka
+++ b/dvb-t/fi-Luhanka
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Luhanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
-	BANDWIDTH_HZ = 8000000
-
-[Luhanka]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Luhanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Luhanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Luopioinen b/dvb-t/fi-Luopioinen
index 9ed4e3f2..f42a2f46 100644
--- a/dvb-t/fi-Luopioinen
+++ b/dvb-t/fi-Luopioinen
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Luopioinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Luopioinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Luopioinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
-[Luopioinen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Mantta b/dvb-t/fi-Mantta
index e2014052..2408d67e 100644
--- a/dvb-t/fi-Mantta
+++ b/dvb-t/fi-Mantta
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Mantta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Mantta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
-	BANDWIDTH_HZ = 8000000
-
-[Mantta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
 [Mantta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Mantyharju b/dvb-t/fi-Mantyharju
index 3b7f127a..b5279142 100644
--- a/dvb-t/fi-Mantyharju
+++ b/dvb-t/fi-Mantyharju
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Mantyharju]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Mantyharju]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Mantyharju]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Mikkeli b/dvb-t/fi-Mikkeli
index f523878c..73b96af3 100644
--- a/dvb-t/fi-Mikkeli
+++ b/dvb-t/fi-Mikkeli
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Mikkeli]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Mikkeli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
-	BANDWIDTH_HZ = 8000000
-
-[Mikkeli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Mikkeli]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Muonio_Olostunturi b/dvb-t/fi-Muonio_Olostunturi
index bfdf0c73..9fc2d779 100644
--- a/dvb-t/fi-Muonio_Olostunturi
+++ b/dvb-t/fi-Muonio_Olostunturi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Muonio_Olostunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Muonio_Olostunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nilsia b/dvb-t/fi-Nilsia
index 208d1c43..5bd8c6ee 100644
--- a/dvb-t/fi-Nilsia
+++ b/dvb-t/fi-Nilsia
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nilsia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
-[Nilsia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Nilsia_Keski-Siikajarvi b/dvb-t/fi-Nilsia_Keski-Siikajarvi
index bfbc561a..31de4b26 100644
--- a/dvb-t/fi-Nilsia_Keski-Siikajarvi
+++ b/dvb-t/fi-Nilsia_Keski-Siikajarvi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nilsia_Keski-Siikajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia_Keski-Siikajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia_Keski-Siikajarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nilsia_Pisa b/dvb-t/fi-Nilsia_Pisa
index 8c8ee34f..159e82b1 100644
--- a/dvb-t/fi-Nilsia_Pisa
+++ b/dvb-t/fi-Nilsia_Pisa
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nilsia_Pisa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia_Pisa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Nilsia_Pisa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nokia b/dvb-t/fi-Nokia
index 8b482ab6..cedaa515 100644
--- a/dvb-t/fi-Nokia
+++ b/dvb-t/fi-Nokia
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Nokia-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
-	BANDWIDTH_HZ = 8000000
-
-[Nokia-B]
+[Nokia]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+[Nokia]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+[Nokia]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nokia_Siuro b/dvb-t/fi-Nokia_Siuro
index 41be97a0..02adb926 100644
--- a/dvb-t/fi-Nokia_Siuro
+++ b/dvb-t/fi-Nokia_Siuro
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Nokia_Siuro-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
-	BANDWIDTH_HZ = 8000000
-
-[Nokia_Siuro-B]
+[Nokia_Siuro]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia_Siuro-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+[Nokia_Siuro]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia_Siuro-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+[Nokia_Siuro]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nummi-Pusula_Hoynola b/dvb-t/fi-Nummi-Pusula_Hoynola
new file mode 100644
index 00000000..cfef9742
--- /dev/null
+++ b/dvb-t/fi-Nummi-Pusula_Hoynola
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Nummi-Pusula_Hoynola]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
+	BANDWIDTH_HZ = 8000000
+
+[Nummi-Pusula_Hoynola]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
+	BANDWIDTH_HZ = 8000000
+
+[Nummi-Pusula_Hoynola]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Nummi-Pusula_Hyonola b/dvb-t/fi-Nummi-Pusula_Hyonola
deleted file mode 100644
index 08840cc3..00000000
--- a/dvb-t/fi-Nummi-Pusula_Hyonola
+++ /dev/null
@@ -1,23 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Nummi-Pusula_Hyonola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Nummi-Pusula_Hyonola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
-	BANDWIDTH_HZ = 8000000
-
-[Nummi-Pusula_Hyonola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Nummi-Pusula_Hyonola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Nuorgam_Njallavaara b/dvb-t/fi-Nuorgam_Njallavaara
index e1c1c3e0..4a10c808 100644
--- a/dvb-t/fi-Nuorgam_Njallavaara
+++ b/dvb-t/fi-Nuorgam_Njallavaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nuorgam_Njallavaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Nuorgam_Njallavaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nuorgam_Raja b/dvb-t/fi-Nuorgam_Raja
new file mode 100644
index 00000000..ba730358
--- /dev/null
+++ b/dvb-t/fi-Nuorgam_Raja
@@ -0,0 +1,10 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Nuorgam_Raja]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Nuorgam_raja b/dvb-t/fi-Nuorgam_raja
deleted file mode 100644
index 2b2cb3cd..00000000
--- a/dvb-t/fi-Nuorgam_raja
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Nuorgam_raja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
-	BANDWIDTH_HZ = 8000000
-
-[Nuorgam_raja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Nurmes_Konnanvaara b/dvb-t/fi-Nurmes_Konnanvaara
index 7cd3d91d..10401078 100644
--- a/dvb-t/fi-Nurmes_Konnanvaara
+++ b/dvb-t/fi-Nurmes_Konnanvaara
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nurmes_Konnanvaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Nurmes_Konnanvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Nurmes_Konnanvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
-	BANDWIDTH_HZ = 8000000
-
-[Nurmes_Konnanvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Nurmes_Kortevaara b/dvb-t/fi-Nurmes_Kortevaara
index 3e118ad4..0f1edbea 100644
--- a/dvb-t/fi-Nurmes_Kortevaara
+++ b/dvb-t/fi-Nurmes_Kortevaara
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Nurmes_Kortevaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Nurmes_Kortevaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Nurmes_Kortevaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Orivesi_Talviainen b/dvb-t/fi-Orivesi_Talviainen
index 149782ea..f5050a69 100644
--- a/dvb-t/fi-Orivesi_Talviainen
+++ b/dvb-t/fi-Orivesi_Talviainen
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Orivesi_Talviainen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Orivesi_Talviainen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
 [Orivesi_Talviainen]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 738000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Oulu b/dvb-t/fi-Oulu
index 3a6127ae..754974ed 100644
--- a/dvb-t/fi-Oulu
+++ b/dvb-t/fi-Oulu
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Oulu-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
-	BANDWIDTH_HZ = 8000000
-
-[Oulu-B]
+[Oulu]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
-[Oulu-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Oulu-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 506000000
-        BANDWIDTH_HZ = 8000000
-
-[Oulu-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+[Oulu]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
-[Oulu-F]
+[Oulu]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 570000000
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Padasjoki b/dvb-t/fi-Padasjoki
index 47246b4b..145b9e4b 100644
--- a/dvb-t/fi-Padasjoki
+++ b/dvb-t/fi-Padasjoki
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Padasjoki]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
 [Padasjoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Padasjoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
-	BANDWIDTH_HZ = 8000000
-
-[Padasjoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Padasjoki_Arrakoski b/dvb-t/fi-Padasjoki_Arrakoski
index c8c1b05b..3c4ebb0e 100644
--- a/dvb-t/fi-Padasjoki_Arrakoski
+++ b/dvb-t/fi-Padasjoki_Arrakoski
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Padasjoki_Arrakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 498000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Padasjoki_Arrakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Padasjoki_Arrakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
-	BANDWIDTH_HZ = 8000000
-
-[Padasjoki_Arrakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Paltamo_Kivesjarvi b/dvb-t/fi-Paltamo_Kivesjarvi
new file mode 100644
index 00000000..51f25b31
--- /dev/null
+++ b/dvb-t/fi-Paltamo_Kivesjarvi
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Paltamo_Kivesjarvi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
+	BANDWIDTH_HZ = 8000000
+
+[Paltamo_Kivesjarvi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
+	BANDWIDTH_HZ = 8000000
+
+[Paltamo_Kivesjarvi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Paltamo_Kivesvaara b/dvb-t/fi-Paltamo_Kivesvaara
deleted file mode 100644
index 56f8ba05..00000000
--- a/dvb-t/fi-Paltamo_Kivesvaara
+++ /dev/null
@@ -1,18 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Paltamo_Kivesvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Paltamo_Kivesvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
-	BANDWIDTH_HZ = 8000000
-
-[Paltamo_Kivesvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Parainen_Houtskari b/dvb-t/fi-Parainen_Houtskari
index e1878142..ff338f60 100644
--- a/dvb-t/fi-Parainen_Houtskari
+++ b/dvb-t/fi-Parainen_Houtskari
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Parainen_Houtskari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Parainen_Houtskari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Parainen_Houtskari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Parainen_Houtskari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Parikkala b/dvb-t/fi-Parikkala
index f0f52f7a..bde180d4 100644
--- a/dvb-t/fi-Parikkala
+++ b/dvb-t/fi-Parikkala
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Parikkala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Parikkala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Parikkala]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
-[Parikkala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Parkano_Sopukallio b/dvb-t/fi-Parkano_Sopukallio
index 62e85079..7ccdf5c6 100644
--- a/dvb-t/fi-Parkano_Sopukallio
+++ b/dvb-t/fi-Parkano_Sopukallio
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Parkano_Sopukallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Parkano_Sopukallio]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Parkano_Sopukallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Parkano_Sopukallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pello b/dvb-t/fi-Pello
index 2cbd28ec..f9fdf9df 100644
--- a/dvb-t/fi-Pello
+++ b/dvb-t/fi-Pello
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pello]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Pello]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pello_Ratasvaara b/dvb-t/fi-Pello_Ratasvaara
index ff7f6607..5165d2d8 100644
--- a/dvb-t/fi-Pello_Ratasvaara
+++ b/dvb-t/fi-Pello_Ratasvaara
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pello_Ratasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Pello_Ratasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Perho b/dvb-t/fi-Perho
index 0a7a2dc9..c24c87d6 100644
--- a/dvb-t/fi-Perho
+++ b/dvb-t/fi-Perho
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Perho]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Perho]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Perho]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Perho]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pernaja b/dvb-t/fi-Pernaja
index 5459e885..5ee2593a 100644
--- a/dvb-t/fi-Pernaja
+++ b/dvb-t/fi-Pernaja
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pernaja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Pernaja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Pernaja]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pieksamaki_Halkokumpu b/dvb-t/fi-Pieksamaki_Halkokumpu
index f03f9a04..6edf0f7b 100644
--- a/dvb-t/fi-Pieksamaki_Halkokumpu
+++ b/dvb-t/fi-Pieksamaki_Halkokumpu
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pieksamaki_Halkokumpu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Pieksamaki_Halkokumpu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Pieksamaki_Halkokumpu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pihtipudas b/dvb-t/fi-Pihtipudas
index 42cdd293..21c66cc6 100644
--- a/dvb-t/fi-Pihtipudas
+++ b/dvb-t/fi-Pihtipudas
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pihtipudas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
 [Pihtipudas]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Pihtipudas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pori b/dvb-t/fi-Pori
new file mode 100644
index 00000000..866fa477
--- /dev/null
+++ b/dvb-t/fi-Pori
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Pori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
+	BANDWIDTH_HZ = 8000000
+
+[Pori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
+	BANDWIDTH_HZ = 8000000
+
+[Pori]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Porvoo_Suomenkyla b/dvb-t/fi-Porvoo_Suomenkyla
index 7b5e79df..a77f1249 100644
--- a/dvb-t/fi-Porvoo_Suomenkyla
+++ b/dvb-t/fi-Porvoo_Suomenkyla
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Porvoo_Suomenkyla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 490000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Porvoo_Suomenkyla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Porvoo_Suomenkyla]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
-[Porvoo_Suomenkyla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Posio b/dvb-t/fi-Posio
index 02586479..75958069 100644
--- a/dvb-t/fi-Posio
+++ b/dvb-t/fi-Posio
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Posio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
-[Posio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pudasjarvi b/dvb-t/fi-Pudasjarvi
index dc85d9ab..6cac7a28 100644
--- a/dvb-t/fi-Pudasjarvi
+++ b/dvb-t/fi-Pudasjarvi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pudasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Pudasjarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Pudasjarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pudasjarvi_Iso-Syote b/dvb-t/fi-Pudasjarvi_Iso-Syote
index 24cebddf..7fc82ad2 100644
--- a/dvb-t/fi-Pudasjarvi_Iso-Syote
+++ b/dvb-t/fi-Pudasjarvi_Iso-Syote
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pudasjarvi_Iso-Syote]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
 [Pudasjarvi_Iso-Syote]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Pudasjarvi_Iso-Syote]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pudasjarvi_Kangasvaara b/dvb-t/fi-Pudasjarvi_Kangasvaara
index cb911634..d221ef3b 100644
--- a/dvb-t/fi-Pudasjarvi_Kangasvaara
+++ b/dvb-t/fi-Pudasjarvi_Kangasvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pudasjarvi_Kangasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Pudasjarvi_Kangasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pudasjarvi_Pauvankangas b/dvb-t/fi-Pudasjarvi_Pauvankangas
new file mode 100644
index 00000000..c707451d
--- /dev/null
+++ b/dvb-t/fi-Pudasjarvi_Pauvankangas
@@ -0,0 +1,15 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Pudasjarvi_Pauvankangas]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
+	BANDWIDTH_HZ = 8000000
+
+[Pudasjarvi_Pauvankangas]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 538000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Puolanka b/dvb-t/fi-Puolanka
index 3370a9a6..00d98269 100644
--- a/dvb-t/fi-Puolanka
+++ b/dvb-t/fi-Puolanka
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Puolanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
-	BANDWIDTH_HZ = 8000000
-
-[Puolanka]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Puolanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Puolanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pyhatunturi b/dvb-t/fi-Pyhatunturi
index c5005761..fc3d90d5 100644
--- a/dvb-t/fi-Pyhatunturi
+++ b/dvb-t/fi-Pyhatunturi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pyhatunturi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
-[Pyhatunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Pyhavuori b/dvb-t/fi-Pyhavuori
index ad232654..f480ea29 100644
--- a/dvb-t/fi-Pyhavuori
+++ b/dvb-t/fi-Pyhavuori
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pyhavuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Pyhavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
-	BANDWIDTH_HZ = 8000000
-
-[Pyhavuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Pylkonmaki_Karankajarvi b/dvb-t/fi-Pylkonmaki_Karankajarvi
index 2d7ef178..bdc07f5c 100644
--- a/dvb-t/fi-Pylkonmaki_Karankajarvi
+++ b/dvb-t/fi-Pylkonmaki_Karankajarvi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Pylkonmaki_Karankajarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Pylkonmaki_Karankajarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Pylkonmaki_Karankajarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Raahe_Mestauskallio b/dvb-t/fi-Raahe_Mestauskallio
index e4cc7b19..68b32581 100644
--- a/dvb-t/fi-Raahe_Mestauskallio
+++ b/dvb-t/fi-Raahe_Mestauskallio
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Raahe_Mestauskallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Raahe_Mestauskallio]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Raahe_Mestauskallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Raahe_Mestauskallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Raahe_Piehinki b/dvb-t/fi-Raahe_Piehinki
index 1b3836d9..2ea095d9 100644
--- a/dvb-t/fi-Raahe_Piehinki
+++ b/dvb-t/fi-Raahe_Piehinki
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Raahe_Piehinki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
 [Raahe_Piehinki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Raahe_Piehinki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ranua_Haasiomaa b/dvb-t/fi-Ranua_Haasiomaa
new file mode 100644
index 00000000..d3e82310
--- /dev/null
+++ b/dvb-t/fi-Ranua_Haasiomaa
@@ -0,0 +1,10 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Ranua_Haasiomaa]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Ranua_Haasionmaa b/dvb-t/fi-Ranua_Haasionmaa
deleted file mode 100644
index 837a10f3..00000000
--- a/dvb-t/fi-Ranua_Haasionmaa
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Ranua_Haasionmaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
-	BANDWIDTH_HZ = 8000000
-
-[Ranua_Haasionmaa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Ranua_Leppiaho b/dvb-t/fi-Ranua_Leppiaho
index 94d3eef7..b0cf60bd 100644
--- a/dvb-t/fi-Ranua_Leppiaho
+++ b/dvb-t/fi-Ranua_Leppiaho
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ranua_Leppiaho]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Ranua_Leppiaho]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rautavaara_Angervikko b/dvb-t/fi-Rautavaara_Angervikko
index c89e4bf4..2a38e8ce 100644
--- a/dvb-t/fi-Rautavaara_Angervikko
+++ b/dvb-t/fi-Rautavaara_Angervikko
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rautavaara_Angervikko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Rautavaara_Angervikko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 738000000
-	BANDWIDTH_HZ = 8000000
-
-[Rautavaara_Angervikko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Rautavaara_Angervikko]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rautjarvi_Simpele b/dvb-t/fi-Rautjarvi_Simpele
index 2d4c254f..ac82d3e9 100644
--- a/dvb-t/fi-Rautjarvi_Simpele
+++ b/dvb-t/fi-Rautjarvi_Simpele
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rautjarvi_Simpele]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Rautjarvi_Simpele]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Rautjarvi_Simpele]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ristijarvi b/dvb-t/fi-Ristijarvi
index 79a58c39..1a1759cb 100644
--- a/dvb-t/fi-Ristijarvi
+++ b/dvb-t/fi-Ristijarvi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ristijarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
 [Ristijarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
 [Ristijarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi b/dvb-t/fi-Rovaniemi
index 87a65b17..04b93e77 100644
--- a/dvb-t/fi-Rovaniemi
+++ b/dvb-t/fi-Rovaniemi
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Rovaniemi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
-[Rovaniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Rovaniemi_Kaihuanvaara b/dvb-t/fi-Rovaniemi_Kaihuanvaara
index 3808ebc8..3bc43c9f 100644
--- a/dvb-t/fi-Rovaniemi_Kaihuanvaara
+++ b/dvb-t/fi-Rovaniemi_Kaihuanvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi_Kaihuanvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
-[Rovaniemi_Kaihuanvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi_Karhuvaara b/dvb-t/fi-Rovaniemi_Karhuvaara
index 069ecb4b..0f8efbbe 100644
--- a/dvb-t/fi-Rovaniemi_Karhuvaara
+++ b/dvb-t/fi-Rovaniemi_Karhuvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi_Karhuvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Rovaniemi_Karhuvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi_Marasenkallio b/dvb-t/fi-Rovaniemi_Marasenkallio
index 6c8d5421..ee7844d1 100644
--- a/dvb-t/fi-Rovaniemi_Marasenkallio
+++ b/dvb-t/fi-Rovaniemi_Marasenkallio
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi_Marasenkallio]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Rovaniemi_Marasenkallio]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi_Rantalaki b/dvb-t/fi-Rovaniemi_Rantalaki
index fe3ea4c5..6a0d962c 100644
--- a/dvb-t/fi-Rovaniemi_Rantalaki
+++ b/dvb-t/fi-Rovaniemi_Rantalaki
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi_Rantalaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Rovaniemi_Rantalaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi_Sonka b/dvb-t/fi-Rovaniemi_Sonka
index 932b409c..f9293d13 100644
--- a/dvb-t/fi-Rovaniemi_Sonka
+++ b/dvb-t/fi-Rovaniemi_Sonka
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Rovaniemi_Sonka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Rovaniemi_Sonka]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Rovaniemi_Sorvijarvi b/dvb-t/fi-Rovaniemi_Sorvijarvi
new file mode 100644
index 00000000..7a0595da
--- /dev/null
+++ b/dvb-t/fi-Rovaniemi_Sorvijarvi
@@ -0,0 +1,15 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Rovaniemi_Sorvijarvi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
+	BANDWIDTH_HZ = 8000000
+
+[Rovaniemi_Sorvijarvi]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Rovaniemi_Sorviselka b/dvb-t/fi-Rovaniemi_Sorviselka
deleted file mode 100644
index feb3bcf4..00000000
--- a/dvb-t/fi-Rovaniemi_Sorviselka
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Rovaniemi_Sorviselka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
-	BANDWIDTH_HZ = 8000000
-
-[Rovaniemi_Sorviselka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Ruka b/dvb-t/fi-Ruka
index de41ddc7..0cc98215 100644
--- a/dvb-t/fi-Ruka
+++ b/dvb-t/fi-Ruka
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ruka]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
 [Ruka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
-	BANDWIDTH_HZ = 8000000
-
-[Ruka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ruovesi_Storminiemi b/dvb-t/fi-Ruovesi_Storminiemi
index ac465cbf..276381ba 100644
--- a/dvb-t/fi-Ruovesi_Storminiemi
+++ b/dvb-t/fi-Ruovesi_Storminiemi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ruovesi_Storminiemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
-	BANDWIDTH_HZ = 8000000
-
-[Ruovesi_Storminiemi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Ruovesi_Storminiemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Ruovesi_Storminiemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Saarijarvi b/dvb-t/fi-Saarijarvi
index 18c923f8..d0710f5f 100644
--- a/dvb-t/fi-Saarijarvi
+++ b/dvb-t/fi-Saarijarvi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Saarijarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
-[Saarijarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Saarijarvi_Kalmari b/dvb-t/fi-Saarijarvi_Kalmari
index 77d5adeb..0d431a9c 100644
--- a/dvb-t/fi-Saarijarvi_Kalmari
+++ b/dvb-t/fi-Saarijarvi_Kalmari
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Saarijarvi_Kalmari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi_Kalmari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi_Kalmari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Saarijarvi_Mahlu b/dvb-t/fi-Saarijarvi_Mahlu
index 48324d0e..42346d0a 100644
--- a/dvb-t/fi-Saarijarvi_Mahlu
+++ b/dvb-t/fi-Saarijarvi_Mahlu
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Saarijarvi_Mahlu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi_Mahlu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Saarijarvi_Mahlu]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salla_Hirvasvaara b/dvb-t/fi-Salla_Hirvasvaara
index e1410a0e..cdce5da7 100644
--- a/dvb-t/fi-Salla_Hirvasvaara
+++ b/dvb-t/fi-Salla_Hirvasvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salla_Hirvasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
-[Salla_Hirvasvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salla_Ihistysjanka b/dvb-t/fi-Salla_Ihistysjanka
index 0d857b59..bf64a06c 100644
--- a/dvb-t/fi-Salla_Ihistysjanka
+++ b/dvb-t/fi-Salla_Ihistysjanka
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salla_Ihistysjanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 586000000
-	BANDWIDTH_HZ = 8000000
-
-[Salla_Ihistysjanka]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salla_Naruska b/dvb-t/fi-Salla_Naruska
index 06bc1bab..c76a516b 100644
--- a/dvb-t/fi-Salla_Naruska
+++ b/dvb-t/fi-Salla_Naruska
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salla_Naruska]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
-	BANDWIDTH_HZ = 8000000
-
-[Salla_Naruska]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salla_Sallatunturi b/dvb-t/fi-Salla_Sallatunturi
index 54a55540..06f723bc 100644
--- a/dvb-t/fi-Salla_Sallatunturi
+++ b/dvb-t/fi-Salla_Sallatunturi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salla_Sallatunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Salla_Sallatunturi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salla_Sarivaara b/dvb-t/fi-Salla_Sarivaara
index eb9bbc0d..35cef63a 100644
--- a/dvb-t/fi-Salla_Sarivaara
+++ b/dvb-t/fi-Salla_Sarivaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salla_Sarivaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Salla_Sarivaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Salo_Isokyla b/dvb-t/fi-Salo_Isokyla
index 0cf08b85..970ef09f 100644
--- a/dvb-t/fi-Salo_Isokyla
+++ b/dvb-t/fi-Salo_Isokyla
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Salo_Isokyla]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Salo_Isokyla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 666000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Salo_Isokyla]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
-[Salo_Isokyla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Savukoski_Martti b/dvb-t/fi-Savukoski_Martti
index aafbdcbd..ec5888fc 100644
--- a/dvb-t/fi-Savukoski_Martti
+++ b/dvb-t/fi-Savukoski_Martti
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Savukoski_Martti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
-	BANDWIDTH_HZ = 8000000
-
-[Savukoski_Martti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Savukoski_Tanhua b/dvb-t/fi-Savukoski_Tanhua
index 91f5fa75..96d882ef 100644
--- a/dvb-t/fi-Savukoski_Tanhua
+++ b/dvb-t/fi-Savukoski_Tanhua
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Savukoski_Tanhua]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
-	BANDWIDTH_HZ = 8000000
-
-[Savukoski_Tanhua]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Siilinjarvi b/dvb-t/fi-Siilinjarvi
index 7fc1f473..87a426a9 100644
--- a/dvb-t/fi-Siilinjarvi
+++ b/dvb-t/fi-Siilinjarvi
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Siilinjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
 [Siilinjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
 [Siilinjarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
-[Siilinjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Simo_Viantie b/dvb-t/fi-Simo_Viantie
index 580c7bdd..7c591ead 100644
--- a/dvb-t/fi-Simo_Viantie
+++ b/dvb-t/fi-Simo_Viantie
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Simo_Viantie]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
 [Simo_Viantie]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Simo_Viantie]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Sipoo_Norrkulla b/dvb-t/fi-Sipoo_Norrkulla
index abfb413d..45c6cf69 100644
--- a/dvb-t/fi-Sipoo_Norrkulla
+++ b/dvb-t/fi-Sipoo_Norrkulla
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Sipoo_Norrkulla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Sipoo_Norrkulla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Sipoo_Norrkulla]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
-[Sipoo_Norrkulla]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Sodankyla_Pittiovaara b/dvb-t/fi-Sodankyla_Pittiovaara
index a123f643..69415ebb 100644
--- a/dvb-t/fi-Sodankyla_Pittiovaara
+++ b/dvb-t/fi-Sodankyla_Pittiovaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Sodankyla_Pittiovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Sodankyla_Pittiovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Sodankyla_Vuotso b/dvb-t/fi-Sodankyla_Vuotso
index 9c60b771..2487b34c 100644
--- a/dvb-t/fi-Sodankyla_Vuotso
+++ b/dvb-t/fi-Sodankyla_Vuotso
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Sodankyla_Vuotso]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
-[Sodankyla_Vuotso]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Soini_Keisala b/dvb-t/fi-Soini_Keisala
new file mode 100644
index 00000000..a9bc6277
--- /dev/null
+++ b/dvb-t/fi-Soini_Keisala
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Soini_Keisala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
+	BANDWIDTH_HZ = 8000000
+
+[Soini_Keisala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
+	BANDWIDTH_HZ = 8000000
+
+[Soini_Keisala]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Sulkava_Vaatalanmaki b/dvb-t/fi-Sulkava_Vaatalanmaki
index 31bdd61f..6e980ef7 100644
--- a/dvb-t/fi-Sulkava_Vaatalanmaki
+++ b/dvb-t/fi-Sulkava_Vaatalanmaki
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Sulkava_Vaatalanmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
 [Sulkava_Vaatalanmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Sulkava_Vaatalanmaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Suomussalmi_Ala-Vuokki b/dvb-t/fi-Suomussalmi_Ala-Vuokki
index 0878a88e..eef587cd 100644
--- a/dvb-t/fi-Suomussalmi_Ala-Vuokki
+++ b/dvb-t/fi-Suomussalmi_Ala-Vuokki
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Suomussalmi_Ala-Vuokki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
-	BANDWIDTH_HZ = 8000000
-
-[Suomussalmi_Ala-Vuokki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Suomussalmi_Ammansaari b/dvb-t/fi-Suomussalmi_Ammansaari
deleted file mode 100644
index 9afcefff..00000000
--- a/dvb-t/fi-Suomussalmi_Ammansaari
+++ /dev/null
@@ -1,13 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Suomussalmi_Ammansaari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
-	BANDWIDTH_HZ = 8000000
-
-[Suomussalmi_Ammansaari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 666000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Suomussalmi_Juntusranta b/dvb-t/fi-Suomussalmi_Juntusranta
index 66c4e5b5..ba6f0bad 100644
--- a/dvb-t/fi-Suomussalmi_Juntusranta
+++ b/dvb-t/fi-Suomussalmi_Juntusranta
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Suomussalmi_Juntusranta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 642000000
-	BANDWIDTH_HZ = 8000000
-
-[Suomussalmi_Juntusranta]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 666000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Suomussalmi_Myllylahti b/dvb-t/fi-Suomussalmi_Myllylahti
index 9630977d..58f6a836 100644
--- a/dvb-t/fi-Suomussalmi_Myllylahti
+++ b/dvb-t/fi-Suomussalmi_Myllylahti
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Suomussalmi_Myllylahti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Suomussalmi_Myllylahti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Suomussalmi_ammansaari b/dvb-t/fi-Suomussalmi_ammansaari
new file mode 100644
index 00000000..c91f5dcd
--- /dev/null
+++ b/dvb-t/fi-Suomussalmi_ammansaari
@@ -0,0 +1,10 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Suomussalmi_ammansaari]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Sysma_Liikola b/dvb-t/fi-Sysma_Liikola
index 9db44246..a5a814bb 100644
--- a/dvb-t/fi-Sysma_Liikola
+++ b/dvb-t/fi-Sysma_Liikola
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Sysma_Liikola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
 [Sysma_Liikola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Sysma_Liikola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Sysma_Liikola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Taivalkoski b/dvb-t/fi-Taivalkoski
index c307ae49..64942c24 100644
--- a/dvb-t/fi-Taivalkoski
+++ b/dvb-t/fi-Taivalkoski
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Taivalkoski]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Taivalkoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Taivalkoski_Taivalvaara b/dvb-t/fi-Taivalkoski_Taivalvaara
index ff81bf02..a21c280e 100644
--- a/dvb-t/fi-Taivalkoski_Taivalvaara
+++ b/dvb-t/fi-Taivalkoski_Taivalvaara
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Taivalkoski_Taivalvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
-	BANDWIDTH_HZ = 8000000
-
-[Taivalkoski_Taivalvaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Tammela b/dvb-t/fi-Tammela
index 42a829c3..6aa0b494 100644
--- a/dvb-t/fi-Tammela
+++ b/dvb-t/fi-Tammela
@@ -1,34 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Tammela-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
-	BANDWIDTH_HZ = 8000000
-
-[Tammela-B]
+[Tammela]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
-[Tammela-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
-	BANDWIDTH_HZ = 8000000
-
-[Tammela-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 554000000
-        BANDWIDTH_HZ = 8000000
-
-[Tammela-E]
-	DELIVERY_SYSTEM = DVBT
+[Tammela]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
-[Tammela-F]
+[Tammela]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 586000000
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
-
diff --git a/dvb-t/fi-Tammisaari b/dvb-t/fi-Tammisaari
index 5248fd22..6b36fe28 100644
--- a/dvb-t/fi-Tammisaari
+++ b/dvb-t/fi-Tammisaari
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Tammisaari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Tammisaari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Tammisaari]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
-[Tammisaari]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Tampere b/dvb-t/fi-Tampere
new file mode 100644
index 00000000..ce5721d5
--- /dev/null
+++ b/dvb-t/fi-Tampere
@@ -0,0 +1,20 @@
+# 2014-04-18 Antti Palosaari <crope@iki.fi>
+# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
+
+[Tampere]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
+	BANDWIDTH_HZ = 8000000
+
+[Tampere]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 498000000
+	BANDWIDTH_HZ = 8000000
+
+[Tampere]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
+	BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Tampere_Pyynikki b/dvb-t/fi-Tampere_Pyynikki
index 0c8815e7..8d0ac805 100644
--- a/dvb-t/fi-Tampere_Pyynikki
+++ b/dvb-t/fi-Tampere_Pyynikki
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Tampere_Pyynikki-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere_Pyynikki-B]
+[Tampere_Pyynikki]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
-[Tampere_Pyynikki-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere_Pyynikki-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 610000000
-        BANDWIDTH_HZ = 8000000
-
-[Tampere_Pyynikki-E]
-	DELIVERY_SYSTEM = DVBT
+[Tampere_Pyynikki]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
-[Tampere_Pyynikki-F]
+[Tampere_Pyynikki]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 514000000
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Tervola b/dvb-t/fi-Tervola
index d2c2d949..33d7cc44 100644
--- a/dvb-t/fi-Tervola
+++ b/dvb-t/fi-Tervola
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Tervola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 626000000
-	BANDWIDTH_HZ = 8000000
-
-[Tervola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Tervola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Turku b/dvb-t/fi-Turku
index f9d29229..954ee7fb 100644
--- a/dvb-t/fi-Turku
+++ b/dvb-t/fi-Turku
@@ -1,33 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
-[Turku-A]
-	DELIVERY_SYSTEM = DVBT
+[Turku]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
-[Turku-B]
+[Turku]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Turku-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 682000000
-	BANDWIDTH_HZ = 8000000
-
-[Turku-D]
-        DELIVERY_SYSTEM = DVBT2
-        FREQUENCY = 594000000
-        BANDWIDTH_HZ = 8000000
-
-[Turku-E]
-	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-[Turku-F]
+[Turku]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 570000000
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki b/dvb-t/fi-Utsjoki
index b884a17a..f6a67b59 100644
--- a/dvb-t/fi-Utsjoki
+++ b/dvb-t/fi-Utsjoki
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki_Nuvvus b/dvb-t/fi-Utsjoki_Nuvvus
index 66d35a3a..00d8578a 100644
--- a/dvb-t/fi-Utsjoki_Nuvvus
+++ b/dvb-t/fi-Utsjoki_Nuvvus
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki_Nuvvus]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki_Nuvvus]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki_Outakoski b/dvb-t/fi-Utsjoki_Outakoski
index 53a75af8..e3f11a25 100644
--- a/dvb-t/fi-Utsjoki_Outakoski
+++ b/dvb-t/fi-Utsjoki_Outakoski
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki_Outakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki_Outakoski]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki_Polvarniemi b/dvb-t/fi-Utsjoki_Polvarniemi
index 0ee4cebd..efbafd97 100644
--- a/dvb-t/fi-Utsjoki_Polvarniemi
+++ b/dvb-t/fi-Utsjoki_Polvarniemi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki_Polvarniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 706000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki_Polvarniemi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki_Rovisuvanto b/dvb-t/fi-Utsjoki_Rovisuvanto
index 7459a8d6..1a21c8cc 100644
--- a/dvb-t/fi-Utsjoki_Rovisuvanto
+++ b/dvb-t/fi-Utsjoki_Rovisuvanto
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki_Rovisuvanto]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki_Rovisuvanto]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Utsjoki_Tenola b/dvb-t/fi-Utsjoki_Tenola
index 96504393..bb9bb98a 100644
--- a/dvb-t/fi-Utsjoki_Tenola
+++ b/dvb-t/fi-Utsjoki_Tenola
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Utsjoki_Tenola]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
-	BANDWIDTH_HZ = 8000000
-
-[Utsjoki_Tenola]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Uusikaupunki_Orivo b/dvb-t/fi-Uusikaupunki_Orivo
index abe1f7f1..a171ac85 100644
--- a/dvb-t/fi-Uusikaupunki_Orivo
+++ b/dvb-t/fi-Uusikaupunki_Orivo
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Uusikaupunki_Orivo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Uusikaupunki_Orivo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Uusikaupunki_Orivo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
-[Uusikaupunki_Orivo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Vaala b/dvb-t/fi-Vaala
index 86e87732..28219cbd 100644
--- a/dvb-t/fi-Vaala
+++ b/dvb-t/fi-Vaala
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vaala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
 [Vaala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Vaala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Vaasa b/dvb-t/fi-Vaasa
index 7826313c..1c55e5b6 100644
--- a/dvb-t/fi-Vaasa
+++ b/dvb-t/fi-Vaasa
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vaasa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 610000000
-	BANDWIDTH_HZ = 8000000
-
-[Vaasa]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
 [Vaasa]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Valtimo b/dvb-t/fi-Valtimo
index 81e82455..f44113d2 100644
--- a/dvb-t/fi-Valtimo
+++ b/dvb-t/fi-Valtimo
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Valtimo]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 586000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
 [Valtimo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
 [Valtimo]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Vammala_Jyranvuori b/dvb-t/fi-Vammala_Jyranvuori
index 26582a83..ac83ccd2 100644
--- a/dvb-t/fi-Vammala_Jyranvuori
+++ b/dvb-t/fi-Vammala_Jyranvuori
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vammala_Jyranvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Jyranvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
-	BANDWIDTH_HZ = 8000000
-
-[Vammala_Jyranvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 506000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Jyranvuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 690000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Vammala_Roismala b/dvb-t/fi-Vammala_Roismala
index 53f37934..d4ef9c2b 100644
--- a/dvb-t/fi-Vammala_Roismala
+++ b/dvb-t/fi-Vammala_Roismala
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vammala_Roismala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Roismala]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Roismala]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Vammala_Savi b/dvb-t/fi-Vammala_Savi
index 189afb4a..73bc64f7 100644
--- a/dvb-t/fi-Vammala_Savi
+++ b/dvb-t/fi-Vammala_Savi
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vammala_Savi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Savi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 
 [Vammala_Savi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Vantaa_Hakunila b/dvb-t/fi-Vantaa_Hakunila
index 4fceb869..4a19e16f 100644
--- a/dvb-t/fi-Vantaa_Hakunila
+++ b/dvb-t/fi-Vantaa_Hakunila
@@ -1,18 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vantaa_Hakunila]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Vantaa_Hakunila]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 514000000
 	BANDWIDTH_HZ = 8000000
 
 [Vantaa_Hakunila]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 514000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Varpaisjarvi_Honkamaki b/dvb-t/fi-Varpaisjarvi_Honkamaki
index 5bdf9742..7b3fb67c 100644
--- a/dvb-t/fi-Varpaisjarvi_Honkamaki
+++ b/dvb-t/fi-Varpaisjarvi_Honkamaki
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Varpaisjarvi_Honkamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 634000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Varpaisjarvi_Honkamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 786000000
-	BANDWIDTH_HZ = 8000000
-
-[Varpaisjarvi_Honkamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 
 [Varpaisjarvi_Honkamaki]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Virrat_Lappavuori b/dvb-t/fi-Virrat_Lappavuori
index 61f12b0b..491afbb3 100644
--- a/dvb-t/fi-Virrat_Lappavuori
+++ b/dvb-t/fi-Virrat_Lappavuori
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Virrat_Lappavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 522000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 562000000
 	BANDWIDTH_HZ = 8000000
 
 [Virrat_Lappavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 
 [Virrat_Lappavuori]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 
-[Virrat_Lappavuori]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 554000000
-	BANDWIDTH_HZ = 8000000
-
diff --git a/dvb-t/fi-Vuokatti b/dvb-t/fi-Vuokatti
index 5a78cf36..c64bd12b 100644
--- a/dvb-t/fi-Vuokatti
+++ b/dvb-t/fi-Vuokatti
@@ -1,23 +1,20 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Vuokatti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
 [Vuokatti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 
 [Vuokatti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
-	BANDWIDTH_HZ = 8000000
-
-[Vuokatti]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ylitornio_Ainiovaara b/dvb-t/fi-Ylitornio_Ainiovaara
index ebd72b90..510fc82e 100644
--- a/dvb-t/fi-Ylitornio_Ainiovaara
+++ b/dvb-t/fi-Ylitornio_Ainiovaara
@@ -1,18 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ylitornio_Ainiovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Ylitornio_Ainiovaara]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 
 [Ylitornio_Ainiovaara]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 610000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Ylitornio_Raanujarvi b/dvb-t/fi-Ylitornio_Raanujarvi
index 885c18f5..c991d720 100644
--- a/dvb-t/fi-Ylitornio_Raanujarvi
+++ b/dvb-t/fi-Ylitornio_Raanujarvi
@@ -1,13 +1,15 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Ylitornio_Raanujarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
 [Ylitornio_Raanujarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Yllas b/dvb-t/fi-Yllas
index 0488cfb8..ee99b04c 100644
--- a/dvb-t/fi-Yllas
+++ b/dvb-t/fi-Yllas
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Yllas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-
-[Yllas]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 594000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Yllasjarvi b/dvb-t/fi-Yllasjarvi
index 67900896..98a3c89b 100644
--- a/dvb-t/fi-Yllasjarvi
+++ b/dvb-t/fi-Yllasjarvi
@@ -1,13 +1,10 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
+# 2026-01-25 Tomi Juntunen <tomi.juntunen@iki.fi>
+# updated frequencies and delivery system to DVB-T2 from https://www.digita.fi/app/uploads/2026/01/Taajuustaulukko-01_2026.pdf
 
 [Yllasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 482000000
-	BANDWIDTH_HZ = 8000000
-
-[Yllasjarvi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 530000000
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-- 
2.52.0



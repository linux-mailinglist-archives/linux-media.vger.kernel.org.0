Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F8D7DB05D
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 00:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjJ2XFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 19:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjJ2XFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 19:05:12 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2082b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EE972AA
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 16:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9v/j5ly4HQocu5DmNYItZfKm0tEOAgmfHZnPNCiZiictUEobxZKSIZQsfA68mzsnlJwTHwwa8ysTAeh1ynew7sxOPJWV6vRMdrhuVNy+cn/5SZWI1N96O896MH1ce2rqvsieV4R3NZbG+Gs31r5sXvHVY1AOjzosD2b1eDDsaxq9Lv0MuZC0C0sqS5WE+NjM8LK9xP9NJ4uXZSkNv6GowvBje28OG9EhzLzZFr0g1bB3tC1hqPn0IN5tE6wOHXsQPvtQ5T7xNt7D6vNxZL7oGN3NC6pU5Hgqshi5QZUY8+p/9Onot0yyGCMDe7v9ZIudRO202OlpxnSkxTsAnLULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oflVLuEItscO0XggWzKdXbrCnq1ynWSUPv2ltjUahRc=;
 b=UX7RxkO4jcjA+TSuPeZ7ceRFMOiJENrx+ZPg01re3ZbbBTPIhsyS6jgVuy9od+4u9IY9rrh86wqrzZlsD/IQ1fbNLCdLLMAZPJW/KZsctCGoDr5RfaubqAZ3N7GRIUWPizORtUwBu1vrkOPmgfVf6F/9vFS6Gy7WwGSUV+296Qs0s/c8e6XKah8b0c0EajvBAW4mg5YUv/bnrvZVmYQFkYt6HBwDXT0HyK6XlKv6ODyYHTLZ8G+n4ApafgSbICQqb5Ir8Eiz7KCvZU9qx2MZPleFU7AuRVBZn17gOlwlxQHtDeiXbu1xFvD8mWT1mqGeilinSe+TYq0hBrTBdt2dJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oflVLuEItscO0XggWzKdXbrCnq1ynWSUPv2ltjUahRc=;
 b=Sm5/G1q4aM/TNRDng4EM4DZrzWa9aQg4AjiY46VF1FWhhZ5s+plSotuodYpXx0xeZCEXGMPhEzfNtss1S3/aJY6yzCvjCIvjYhvsyb9bwHGjHn864L3Kkt4VvdLetq7cOsw54N1OnwglfqCJy2Wa/KPWcOnoF321G0XHpvvIl0InSy0tz3cCYNUTJhHnEhz1J1u0qc/7j3nge546L5WclMaY1pesK/7TKqRs99NCFMI/mxFX4pCgDDNB55P8SG5hs9A5c4UfM0BpB9NtPIIkYguva9d6cfWwN3ZlDtXeCFlOwxvdw2xuXDilaJik82CraB27KS4j1es99no3VpOILQ==
Received: from DS0PR19MB6526.namprd19.prod.outlook.com (2603:10b6:8:c6::6) by
 DS0PR19MB7468.namprd19.prod.outlook.com (2603:10b6:8:14e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.23; Sun, 29 Oct 2023 23:00:58 +0000
Received: from DS0PR19MB6526.namprd19.prod.outlook.com
 ([fe80::49d1:6864:22d3:80e9]) by DS0PR19MB6526.namprd19.prod.outlook.com
 ([fe80::49d1:6864:22d3:80e9%2]) with mapi id 15.20.6907.022; Sun, 29 Oct 2023
 23:00:57 +0000
From:   Vince Ricosti <vricosti@outlook.com>
To:     Sean Young <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: Questions about ir-keytable and ir-ctl
Thread-Topic: Questions about ir-keytable and ir-ctl
Thread-Index: AQHaCaBbVCT9IO1MKkGOHNs3mwDN17BfNXOAgAIDw2SAACqEcg==
Date:   Sun, 29 Oct 2023 23:00:57 +0000
Message-ID: <DS0PR19MB6526A0F28CD9CE83F37AF594D3A2A@DS0PR19MB6526.namprd19.prod.outlook.com>
References: <DS0PR19MB6526C9164F0E0883B380D2D3D3A3A@DS0PR19MB6526.namprd19.prod.outlook.com>
 <ZT0PXddD2tphScNh@gofer.mess.org>
 <DS0PR19MB65262E1BBF637CC86C5A5490D3A2A@DS0PR19MB6526.namprd19.prod.outlook.com>
In-Reply-To: <DS0PR19MB65262E1BBF637CC86C5A5490D3A2A@DS0PR19MB6526.namprd19.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn:  [nVmlHaoInr7dvo6lfiIWFKOZYMb0D1H8q4gyf2ZZbVC11JtwlNfi5iXAm+0dXCtT]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB6526:EE_|DS0PR19MB7468:EE_
x-ms-office365-filtering-correlation-id: 40ea591e-8329-4dff-bcf2-08dbd8d2e9bf
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xNWqbHCgCwMTglzn2uokLLrxLimBO3Mw9aSzpHe8sVS8NETbyE2WEeNFhY1rk1ptN3RdgqTESkf6k3BrldGDGVITscL3TPXn1nCYyDyEDqW/U0yZ09qGG3YzS4bRh9tf1RaRpTQEbGG49CEjoeADk+nxWU6Bw+Kf+ppxWJWonyideUCjriyTWV2YuhUyWKXuqTQe8zb8e2gwW7vdNmIhdXeZWYIfqj3POi3Y4FzTDXK+t4Dph5irIr6jCK0E+6SnUUZ6kRrQ3frklDnGvx6AvOSati4lG8cajTATSwVdYOhY3+dFBoOnogEujsY2rjR1IFG2GHRZoXjjePjru98j3agUFL1fvGC6bc6Ey2LuBDSlms3up/w7wdvJgUsI5cVw6TvANkbrXpUBZfYUgKG/aiToK5G96W/TAK0unC30+sZ/H82J9kHbQsAvM0MqaHHUrCTgjXArUZ+zy1dzOzklW4b8n/tKyG7US+EdP7q23ppkg6zOUqgBHnjeBJ3kbJmIFqEFgQilHw411Rk4D5Hm86hQij6PVpLtMJeedKrJZEnnUiBj0G4LhBYopiddWqR
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6ymBrcAdU7tWXu+UB5+SoWVV09/u10QSJRmccMy3Oa9iKuQo76H7t2tQPJ?=
 =?iso-8859-1?Q?VMQu/qTTB83QkUQ3LGdM+II4OxoDUSxYPo5wrRFVnYCaKLKtbqEtV5/E5w?=
 =?iso-8859-1?Q?4BVltpqZCOgzGE97I2HYTbfvvrdGpdhxc80IytT8zPt0zuKDkdmcRRMAIV?=
 =?iso-8859-1?Q?ZpQkcRQY9bdutpSFv/fRxahpbZTeKeOasoCgKlgx2jozOLQ4WW+buKRXNl?=
 =?iso-8859-1?Q?dOU4t8bxlCl0T3p4PhlWLFU4RZnT6amUFAUs4NIrxhraTdIYV07yEorKG9?=
 =?iso-8859-1?Q?6Cg3m2QI3j/LiCd07Trv7UcMPiRMb2gQDfZBUEQRvYqI/Mw9qo3jgaZunH?=
 =?iso-8859-1?Q?6Mt0aGqtBCAGSp/TgR0LKI7BaHhPJi5N/n/a44VYqSieRX+SMBs+byDIq2?=
 =?iso-8859-1?Q?aXsBJ250Xj63PqTrOM2i67uKPJu/aiatOOI4pqmuF23ccFuTdsat3oGFmx?=
 =?iso-8859-1?Q?V3GO2gqtuVwasxF7xOXxqIvaG+dfNKnFvXVGguA/OjX97IHCckZ0hnYeJZ?=
 =?iso-8859-1?Q?z0Q7rbE5o1Vq0qLhfAQkDnfILw0H9i0t8LtS/oLhvCTJdQPBsxA1M/RgOA?=
 =?iso-8859-1?Q?AtlXAx6jtvJr6hv3Jjssvn+H67qDfBdNd6sUT7B/ZSFqWnn4rqQH7Kf4T6?=
 =?iso-8859-1?Q?MgouCbc4jSQarldAP8OROWVJDXs1zypYZdkvBk9Ci4glixjh7KarEvfCw1?=
 =?iso-8859-1?Q?7oR7FnRShk+mxSlM48qsh5i7h1+OtlqF/M/wN9tA6P/1GVNqK2gah1QEPn?=
 =?iso-8859-1?Q?HC+l/wN8hYhUYMaqMM2Qi0SK6esOoV1NrHHS0XbeJH7qRHP5QS8yDq9hSU?=
 =?iso-8859-1?Q?dOFBw0izZqup22wG1tHwjvmD5QhwhGTRcrN/22gQTrv4WhtLap3wgkHKRj?=
 =?iso-8859-1?Q?hRm7Qc8h2d5EYHq5Bn4CxODb1JBlkFvAkyAxiTsgI2fywat3ZmfL3HejLi?=
 =?iso-8859-1?Q?zrsPaHboDOsrrjMlwbvIp/9z+8okPPNWDgRhWUEZP1k6HHBQWejGZMS4/j?=
 =?iso-8859-1?Q?q7Gg8WRwpp8BAEyUyugGbFPBGgvz6lMrp8XXNrcaXmsAN/J/rWUZRY2vLZ?=
 =?iso-8859-1?Q?ZJmk82c01RkRfuEXn+/DB3xTe8YzDO9cqBTA05NhaP9jsIr1rqJRzj/Uj1?=
 =?iso-8859-1?Q?6LTzMyWmpN6IPrIvmdqNYKOdZj++GVE96Hqt5zoS3h4MoBasLIfW0RTuAm?=
 =?iso-8859-1?Q?QZEZgzgr6Nrm8zHKil5E5xDlOsIYJ8wVZPTjyFKBWO2N6SlAb8Fubslm6P?=
 =?iso-8859-1?Q?43NjsJ7WRGPJQFPWR6lcS5ewU96poaPCzmXIfAO2S01ocgNcIlLBr2QyFq?=
 =?iso-8859-1?Q?Ma+NxdI0sSW6bgibHNdvtc6OHQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB6526.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ea591e-8329-4dff-bcf2-08dbd8d2e9bf
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2023 23:00:57.8961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7468
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I forgot this patch that will avoid people to wonder why nothing happens wh=
en sys dev is wrong:=0A=
=0A=
--- tmp/v4l-utils-1.20.0/utils/keytable/keytable.c	2020-05-21 11:22:36.0000=
00000 +0100=0A=
+++ v4l-utils-1.20.0/utils/keytable/keytable.c	2023-10-29 20:23:48.58065588=
1 +0000=0A=
@@ -2067,6 +2067,7 @@=0A=
 		return -1;=0A=
 	rc_dev.sysfs_name =3D names->name;=0A=
 	if (get_attribs(&rc_dev, names->name)) {=0A=
+		fprintf(stderr, _("Wrong sysdev %s: cannot retrieve attributes\n"), devc=
lass);=0A=
 		free_names(names);=0A=
 		return -1;=0A=
 	}=0A=
=0A=
Regards=

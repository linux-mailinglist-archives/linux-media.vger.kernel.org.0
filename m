Return-Path: <linux-media+bounces-3854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A853B83184B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5B1281F02
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946F923776;
	Thu, 18 Jan 2024 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nE02yOBf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mCmqwUuZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VdNDAcib"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1897623768
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576587; cv=fail; b=axEkgDx5T36O+tQDmFfDwHC4Smr0wr2HxF90BLZIJnu5kWjgQ33rHiBGj+HGM1oXbXr6UFf7/RkxQTgERTY9eG5qhZ+YlWoDtpLGk6YPGrDHN8RGU/0KiYbbz7ON2AVvemDdGlaHD5xyO87Bu0gjKKM9ARCGArdM8eU6pp3LcQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576587; c=relaxed/simple;
	bh=zv0JFssQg+Z9g5pfysIhfx3EbyggXYcQb8ekVBqDgHo=;
	h=Received:DKIM-Signature:Received:DKIM-Signature:Received:Received:
	 Received:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:Received:Received:X-SNPS-Relay:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:x-dg-ref:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=N7ULX6Me7ZvpjyQENvbochZHxk1BzRhLjo3uf0gsZron0XWoUu7hA3WY97iVK8zaDBffqYGQfUTcPJ8aDoWSo7v/ZWfeEAsz26WKxz9VMg71S0W5qCEASeVNocsqzfMwkD8CKQlwdwHBqsFB+hEVsYDPXidlAQz0ayB8zsYWfqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nE02yOBf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mCmqwUuZ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VdNDAcib reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IAHKrk027897;
	Thu, 18 Jan 2024 03:16:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=4FBB
	vu97szrl3hJlX1mkJBlKoi5ieVJq8ws/0VysNuk=; b=nE02yOBfv0oNaxhV1Sgb
	rsXnrfSXgapZ+SYCFJIAh6q4YpfsO9NXhZtHVHyt9XaObEofKGA8qd9BOd1ocBKg
	D1/l2tmzvzICgUheU0PEPDrkH/87DxlwhpmZendT2xm7nvkeLrOF+ChKMA+2iWeH
	h9xuLG/yFqovWqyayGKlc3v/etBmyRdtztEwlcmwrs27N6vt3GkgfGlqnXTCWZqx
	wJIoJ2D2T5DKY/KEqY86NISJR574N9H+HpqPpF+Pl/cVBl//NtbO2xc78ebLLOn7
	IjQEHXF/li2apeSJMnBqYLHWViF0JdBqssSIm93gWASKRjifF0lRQsHkQc0QSU/I
	tw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vktdnqah3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705576575; bh=zv0JFssQg+Z9g5pfysIhfx3EbyggXYcQb8ekVBqDgHo=;
	h=From:To:CC:Subject:Date:From;
	b=mCmqwUuZmejGR9xf3rN8IARYXZUhdJLKWKJu+P+xjbbzHr/r5hdOPe4NHcZzaK9us
	 RWiZ1MCcdYjfsynDCxOPfWzNRVorJrvS6g4b7mGTY8f9QBF/D6fj9X3SA3RPWAbaLx
	 zneqUyoD55AcHZ1UegsKLgPyvYI34T473TQyTRiNUK4dPAI1cIpOxuNVwxC51by8+0
	 4mlFshNKPI6M8rPHLD5GzNzyDyD7a2TIxmdODuFlW5XLVU6xFZj5/zbEeeh7mrV42x
	 AT2G7OB8o56Mma9MvkZSUX2CRFNmkea/k620DBdiAFXfUNTIXNPjCNFvQeqF+RcnRq
	 uxBQD97b3yuxQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 29546403B9;
	Thu, 18 Jan 2024 11:16:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B2FBAA0090;
	Thu, 18 Jan 2024 11:16:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VdNDAcib;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D339B400A2;
	Thu, 18 Jan 2024 11:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQURZBDR23cGaHB2++jytAEsJrirkpg1u+yvufcUwRhXl7+8k8jCRPhHqT6Ec6Vwg1JSc4ZQJYrHfCQZxEzt1gnPTYPBkmRSOYZjvpOUKwSwFoCdGAdUbUZowd+mDJJGWPPaAI096eJy4P6pSt8bowpfinD8dVflNuXNCxwgOcCuNu2WYu5JPo7gbvZk31wmx9ugvdQI9x6/In6YUzWlsi+mn3ox7B7RZNkrJPVhNfKQyiS8L6PmL3/h0xH9XUEfoV6sPJJALcXooAkc/Dn7zyD5MOKgcHwjNrw2xZ+YkEc0B4ZxMGs569Th5bVqy8i1UsE86c5R7ysqzPcjbhFCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FBBvu97szrl3hJlX1mkJBlKoi5ieVJq8ws/0VysNuk=;
 b=VQBM7pCbCjxZ4b7CGvQwxkKtT0CNlrzB5hMt5SKBKaVXOXW6XWlJOryvAT34bfaLC57NzscAptctMX2EjY7HMj4UeUcGXc76g8FZBwKR4t92DgD7VncWarAdf203W7NTNOHz0ETWMN776YWmVEP+yg6tTHPYfd4NogVArjG6hTA+c0N5jsWxVajdAVDNjn9Y190gSXe01wcLOPu8cMVv+0ej/mHUkWRovrqB+9dszF+WcW3+n1xfEFA6y8fEEUtUArc5OqJriC3nw0b7e9mlaV4GTsgnb15agQXR23M8StfsdjWUXZKcFXr/SoK3WLK5haMhURMuUL9b3mj+weB4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FBBvu97szrl3hJlX1mkJBlKoi5ieVJq8ws/0VysNuk=;
 b=VdNDAcibUrllZpJLPj9Px+k3RAcVnrjnUzdNPxd6pQJe2SreWvp1HlNqysprdOeeNunlrl5tmW8rLc0vipDNg2q+03eo1OtFf6KhiUcURAFKhVmjiBjW59Bsy2B4TAzZPw4uFG3lK/6wHnyBq3txy0OON/09qrpswZORNaQLqSA=
Received: from IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Thu, 18 Jan
 2024 11:16:08 +0000
Received: from IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::b410:a6ac:5b7e:eddd]) by IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::b410:a6ac:5b7e:eddd%6]) with mapi id 15.20.7159.020; Thu, 18 Jan 2024
 11:16:08 +0000
X-SNPS-Relay: synopsys.com
From: Joao Pinto <Joao.Pinto@synopsys.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Joao Pinto <Joao.Pinto@synopsys.com>
Subject: Request support: Use Case where the CSI-2 Camera sensor not in I2C
Thread-Topic: Request support: Use Case where the CSI-2 Camera sensor not in
 I2C
Thread-Index: AdpJ/7nLIQWjL9cmTouQE0BAscQEhw==
Date: Thu, 18 Jan 2024 11:16:08 +0000
Message-ID: 
 <IA1PR12MB768785356D6E461FD05C71D4B1712@IA1PR12MB7687.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcanBpbnRvXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZjkwZDA4NmItYjVmMi0xMWVlLTg2NDctY2M5NmU1YjhlNGQzXGFtZS10ZXN0XGY5MGQwODZjLWI1ZjItMTFlZS04NjQ3LWNjOTZlNWI4ZTRkM2JvZHkudHh0IiBzej0iNTU0NyIgdD0iMTMzNTAwNTAxNjcwNjk0MzIwIiBoPSJscm9LdGpqUmRKd0YvRkZxUm02K2ROalhVRFU9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB7687:EE_|SN7PR12MB8604:EE_
x-ms-office365-filtering-correlation-id: 1a23b918-8e22-4604-6194-08dc1816dead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m5iqaqIyUIDNHAJW+d7omAICCLF4W83PidsLucTrT2q4z5lWwzaOT+zV418d5HxXvS1naI2T/mwNoYM54Fa61arB1l+mm3FOjqOm0bd/a0Su9n/apb7SAGmmowoh189KcETQMxrTKrIKmwCz4m5zWJP53EKotQZh0DG+Elc9CAoIx/UiX/Mq2dW3NsTlguMVo67pjjP6akdHIsVA78ZVloq7+1BWIrmrfedhU60G6oQz+3Kny4ZzvkP+XF8tPq2h2TAR26pU8iskjUfAqaB9CAv2mwzmNn7a4ffmI54w+PUpwmxPbMER5eHauci1lFefPITplpvquUU38p6vVsJqGFylOlYJsg6+MoGpaR0JzHT3ErSQjKIaCqlHuW9bnKDoKVCfHfchjFpvAkzzT26N1Mj33JACkuhhlGwOEyxS81d8oOjiRoTpiJAumfg4HO4RYbudd+nXMznsBGg+1vNLYz1Pm5sPX9iEIzAnucjuFNVkWSYiywA6tWmtNBgjnYKxKGlSB2+ddMSbUhY9ljstlgb6wG/NRqU3LjjekcIUg+jcXUb3FwaPO0NJPv12oIEBYfyLCczPpYAQWFlh5Qj4CuvwdE/smF+ijzU19QyVk3zneV4S5j00vHd7OwDvnsPm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7687.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(9686003)(5660300002)(2906002)(66946007)(64756008)(66446008)(66556008)(54906003)(7696005)(122000001)(4326008)(316002)(38100700002)(8676002)(8936002)(71200400001)(76116006)(52536014)(66476007)(478600001)(55016003)(6916009)(38070700009)(33656002)(41300700001)(83380400001)(107886003)(26005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iete1y/CcjiGPVqz19bY6iSqgbmYASW3qbeGtIv7Dsh4XMaI8p40lVTVmY6n?=
 =?us-ascii?Q?WsnkFfOM2wEzOgr1wzvzzXgcSdALOYkJEll7SFl4pTrxclqt7VUAOqFM5u/3?=
 =?us-ascii?Q?BKN0sfmy9vWXs/9a9Z3mW9USWnR1J3U4x/QEYc1UgajPPodTSIPTPNTTI0B4?=
 =?us-ascii?Q?6oT3kPus52xmA4raUbBMbPYTIVFYO2ivs0bDMAF48irDD4SJOlAg46jELutO?=
 =?us-ascii?Q?mvLxn1Ll/kzHRT3k6EY9hPomqAORK5D6OY8yVKm33svzQQdcKQsUMwWoruw3?=
 =?us-ascii?Q?XSAaJPx712211+PU4gKoDT5W8N27rbgMKGKuiicY6nn9/yQ6+r07lm8uUupH?=
 =?us-ascii?Q?BNebN6PE1JNz1eDA9HTf4WA6z3HiIrweN41wRLnwIwHgGNhJDsNkDro2k94E?=
 =?us-ascii?Q?EdedDKeQExZvVL6OYF4SqXJ/u7ZV/33KDeZ4NS+novlOkuEaPfqUUFDJ8tBB?=
 =?us-ascii?Q?bSp2jfDNmBZVSYe3Ys3F/FxM1kRduqFPE1iPeAIxsayOvrSzGGSKsr0DuNni?=
 =?us-ascii?Q?NqKyxnLIySSHLr9tXPN9kxpDJCyxe3zqOCLcVJlrIVQhS22a9aVWRjsfjyrQ?=
 =?us-ascii?Q?gcR9QynkWpTA0VxvZ5DGchmTaobMAwZgTzUiXtZK1TTaQ+7V/ROHRZVlF4Q5?=
 =?us-ascii?Q?qBqP4EK3Wwwg3BmPFFbiOZITlboHlxGN343RT3fxu1hR4ENVKuEwX+sU6wPR?=
 =?us-ascii?Q?Y1wxnCuqTs43/emT+8rsxARf5oRLJsICexzxdRHSK5SBTqbKyFBf3pROEo1O?=
 =?us-ascii?Q?H9+uidMwYE2oms6RZdAqoYXRevCVpbz6+yU4i9KaUHMJoyPKGur5DT52nv5C?=
 =?us-ascii?Q?PpEDgvef+JsyfkVurq6q2WzN/qPLHJvPZWNAx+A5pqC42cdI5crmcFR28t1A?=
 =?us-ascii?Q?Q2w0CriPYH3slwYl0UclHm7jXPutjA7U7QzaFnZYZVYOIEHusyWTbnUbx6IO?=
 =?us-ascii?Q?d6sxwUon8LZF133fzcPGDf1nFUC16iyZjDOfNo9w9UsXankxlvoTCMHoCCDQ?=
 =?us-ascii?Q?eXo6PBbW+hEaBo2eXjPrpMWLu8Ehsq04kL4lsJ+iNT7K2i5kMb64+NfBThXm?=
 =?us-ascii?Q?EHY7XTYOQNKqJHl/S1xaUpVaIRy//F/m0w4vfYcvrfcZiAaoLTSDw155XfBY?=
 =?us-ascii?Q?i7B+Ox2rta/4uqE4Y5tNX5+oBJEM4OohJTAiS2d9NhWG+vWJU+B5D/x/7aNK?=
 =?us-ascii?Q?bEdf7KehHBdJBXUS/OttdmeXb50pbM0FPpa+DHW19QsP92qW2/E0B/YCbgRi?=
 =?us-ascii?Q?jU7Y9T/tagQCNc2p3yGqFPDSGOzIhPXJsF2djqlwmqE6hSMGf+J6jdqIivge?=
 =?us-ascii?Q?/zP2fJcIgCwYGcKcNN+h1Hu7+0yZ+UdrD6DtAJvm3lCAwBc7AIlNQ/n727k9?=
 =?us-ascii?Q?utUQlkfWVlXV1rMUTNxDvqCseyV61AMhU1QOrJmkOpjuaAXQF4N1xBKn4vdx?=
 =?us-ascii?Q?9LUXEs7GPzyUkvNqgx73YcH1nS9wuO0DbOENfhRlO6Yu4AUwlgUyVgdYrH/d?=
 =?us-ascii?Q?LHtc7Dp15r+TI5Ikv5Y5gJ4E1FwVxOuCLdbLMDPpy+9h4AsVkaIS9ynWtW9w?=
 =?us-ascii?Q?Nr99de2nIrBUWdbJ9PZq6nFC/efTcMWhM4W6ml6x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4/XEyll6iHq3qcWjqWYuhmp4tTWuyzrraH4K0fYzNQ6DTL34UJVJFezrW+6nUVBg1YaSlA8ePRDDsvD74vPAz+y1f6WBgK5HbQvL0mE3BcARv7/c3gX+p3JGHom3WAiRj8VKsbrcWtMIknTrGofBfn7oa1CyOLbXjnmPNW+QuYKDrNTJsfwWUBxZj7MpMoqN5UTjdr3tqmpArRcrKyz4UlxKWFFUN5ofpY7DB0iKCNA9rGRTp5vHcLH6m1nI+YNpzbPfAN2wGuMvcybi2q3i0MaAvNs2mXETAkGsH6+GLl5D6LkwrcUMbaz6SorIQ1ynEiDrDJxkDsQJo4svv5AcAR8EG8WRRMyIAjTR6SHVv7Z/CPknJrpjf7lx6ncLGEsONF0Tv/or2xsdxsZFDmngtertef3CmvlZmdEZP8wJpvMFOE84683OVJldkUn1q039Eg9Hjh0fBwnzz67+c52r2OdFfIextcwUkdu7/RVyJ9gtKoR08hikzzzk6LJ/L90q/4fD3RsYbuHbKHMbl5iSE5kwekuMieA0DrpLQYNUVFKRxJBXNpmM52KN5GtVUTj9GpN2++rhjnjCmd8ML3dAN4HjWtv/Eh/Msa6uoxbp1kBsJLiqhog3/inj4Vto0SBln/vfM1+JNdtfjyDefopr0g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7687.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a23b918-8e22-4604-6194-08dc1816dead
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 11:16:08.3398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZLH5o+/Zo32YbrO/kkdThLUxyh8fkzDK0bVxzrP6FTIfV9MGmEgtABsNotG8mm52sKXWukUKzhRveSiPrQNNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604
X-Proofpoint-GUID: nvvgtQK_yoRIo4jHqN8wYDky2Fo3l_px
X-Proofpoint-ORIG-GUID: nvvgtQK_yoRIo4jHqN8wYDky2Fo3l_px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_06,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180081

Dear linux-media colleagues,

I am sending this e-mail to kindly request your support.
Although I understand that the typical CSI-2 Camera use case is to be part =
of a I2C bus, I have the use case in which the camera is not part of I2C, h=
aving its registers accessible through AXI. =20
I created a camera driver (dw_vdk_gen_cam) based on a I2C camera driver, bu=
t adapting has best as possible to a platform driver approach.

The current issue:=20
When the top glue driver executes v4l2_async_notifier_register(), v4l2_asyn=
c_find_match() is not successful as shown below, and so the .bound  callbac=
k is not called, not allowing the link between the Camera and the CSI-2 Hos=
t CTRL.
I would greatly appreciate if you could provide an insight of what might be=
 missing.

A snippet of the execution:

D-PHY driver:
[   28.927984] phy phy-50000040.dphy.0: Probing dphy finished

CSI-2 Host Core driver:
[   28.981723] dw-csi 50000000.csi2: got demo_irq.
[   28.981937] dw-csi 50000000.csi2: Version minor not supported.
[   28.982028] dw-csi 50000000.csi2: DW MIPI CSI-2 Host registered successf=
ully HW v1.54
[   28.982120] phy phy-50000040.dphy.0: Init DPHY.
[   28.982196] dw-csi 50000000.csi2: Probing csi finished

Generic Camera driver:
[   34.178568] gen_cam_parse_dt(): Node Name: endpoint
[   34.178972] dw_vdk_gen_cam 50002000.camera1: DW VDK Generic Camera regis=
tered successfully

Video-Device driver:
[   34.199102] video-device video-pipeline:video-device: Requesting DMA
[   34.199369] video-device video-pipeline:video-device: VIDEOBUF2 DMA CONT=
IG
[   34.199461] video-device video-pipeline:video-device: Video Device regis=
tered successfully

Top v4l2 glue driver:
[   34.243452] Executing plat_csi_probe()
[   34.243516] Executing plat_csi_register_platform_entities()
[   34.243635] dw-plat video-pipeline: Platform device video-device found
[   34.243699] Executing plat_csi_register_platform_entity()
[   34.243757] Executing register_videodev_entity()
[   34.243811] Executing plat_csi_pipeline_create()
[   34.243896] dw-plat video-pipeline: Entity type for entity Capture devic=
e was not initialized!
[   34.244442] plat-ipk: Registered video-device as /dev/video0
[   34.244567] dw-plat video-pipeline: Platform device csi2@50000000 found
[   34.244631] Executing of_get_port_id()
[   34.244686] Executing plat_csi_register_platform_entity()
[   34.244745] Executing register_mipi_csi_entity()
[   34.244798] Executing of_get_port_id()
[   34.244863] Executing plat_csi_register_sensor_entities()
[   34.244925] Checking node video-device
[   34.244982] Checking node csi2
[   34.245031] Going to execute plat_csi_parse_port_node()
[   34.245088] Inside plat_csi_parse_port_node()
[   34.245144] Endpoint Name: endpoint
[   34.245232] Endpoint REM Name: camera1
[   34.245282] Sensor has been found
[   34.245333] Number of sensors in plat_csi_parse_port_node(): 1
[   34.249688] Executing v4l2_async_notifier_register()
[   34.249743] Executing __v4l2_async_notifier_register()
[   34.249800] __v4l2_async_notifier_register(): Check list of asds
[   34.249863] __v4l2_async_notifier_register(): Going to v4l2_async_notifi=
er_try_all_subdevs()
[   34.249935] Executing v4l2_async_notifier_try_all_subdevs()
[   34.249997] v4l2_async_notifier_try_all_subdevs(): v4l2_dev->name: plat-=
ipk
[   34.250071] v4l2_async_notifier_try_all_subdevs(): List Entry =3D> subde=
v  | Module dw_vdk_gen_cam
[   34.250147]  v4l2_async_notifier_try_all_subdevs(): Going to execute v4l=
2_async_find_match()
[   34.250218] Executing v4l2_async_find_match()
[   34.250272] v4l2_async_find_match(): SubDev Name =3D=20
[   34.250331] v4l2_async_find_match(): Module name =3D dw_vdk_gen_cam
[   34.250392] v4l2_async_find_match(): Ups... return NULL
[   34.250451] __v4l2_async_notifier_register(): Going to v4l2_async_notifi=
er_try_complete()
[   34.250521] Executing v4l2_async_notifier_try_complete()
[   34.250579] v4l2_async_notifier_try_complete(): All done!
[   34.250636] Executing subdev_notifier_complete()
[   34.250691] In subdev_notifier_complete() - Going to execute plat_csi_cr=
eate_links()
[   34.250763] Executing plat_csi_create_links() | Num Sensors: 0

Current device tree:
	mipi_dphy_rx1: dphy@50000040 {
		compatible =3D "snps,dw-dphy-rx";
		reg =3D <0x0 0x50000040 0x0 0x20>;
		#phy-cells =3D <1>;
		bus-width =3D <12>;
		snps,dphy-frequency =3D <300000>;
		snps,dphy-te-len =3D <12>;
		snps,phy_type =3D <0>;
	};
	camera1@50002000 {
		compatible =3D "snps,dw-vdk-gen-cam";
		reg =3D <0x0 0x50002000 0x0 0x7f>;
		port {
			camera1_0: endpoint {
				remote =3D <&csi2_0_ep1>;
			};
		};
	};
	video-pipeline {
		compatible =3D "snps,dw-plat", "simple-bus";
		#address-cells =3D <2>;
		#size-cells =3D <2>;
		ranges;
		video_device:video-device {
			compatible =3D "snps,video-device";
			dmas =3D <&axi_vdma_0 0>;
			dma-names =3D "vdma0";
		};
		csi2_0:csi2@50000000 {
			compatible =3D "snps,dw-csi";
			reg =3D <0x0 0x50000000 0x0 0x7ff>;
			interrupts =3D <0 10 4>;
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			output-type =3D <2>;
			phys =3D <&mipi_dphy_rx1 0>;
			phy-names =3D "dw-dphy";
			ipi-mode =3D <0>;
			ipi-color-mode =3D <0>;
			ipi-auto-flush =3D <1>;
			virtual-channel =3D <0>;
			port@1 {
				reg =3D <1>;
				csi2_0_ep1: endpoint {
					data-lanes =3D <1 2>;
					remote-endpoint =3D <&camera1_0>;
				};
			};
		};
	};

Thank you in advance.

Regards,
Joao



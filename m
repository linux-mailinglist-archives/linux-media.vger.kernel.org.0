Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C974F2739
	for <lists+linux-media@lfdr.de>; Tue,  5 Apr 2022 10:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbiDEIFN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 5 Apr 2022 04:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbiDEH7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 03:59:03 -0400
Received: from mx-ginzinger.sigmacloud.services (mx-ginzinger.sigmacloud.services [185.154.235.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D31F54FA6
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 00:53:32 -0700 (PDT)
Received: from mail-db3eur04lp2053.outbound.protection.outlook.com ([104.47.12.53]:48708 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
        by mx-ginzinger.sigmacloud.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <Stefan.Hager@ginzinger.com>)
        id 1nbe08-0001Js-31
        for linux-media@vger.kernel.org; Tue, 05 Apr 2022 09:53:21 +0200
Received: from DB6PR07CA0167.eurprd07.prod.outlook.com (2603:10a6:6:43::21) by
 PR3PR06MB7049.eurprd06.prod.outlook.com (2603:10a6:102:84::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.30; Tue, 5 Apr 2022 07:53:19 +0000
Received: from DB8EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::1b) by DB6PR07CA0167.outlook.office365.com
 (2603:10a6:6:43::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.18 via Frontend
 Transport; Tue, 5 Apr 2022 07:53:19 +0000
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000,
        BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
        BODY_SIZE_7000_LESS 0.000000, BODY_SIZE_700_799 0.000000,
        HTML_00_01 0.050000, HTML_00_10 0.050000, NO_CTA_FOUND 0.000000,
        NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
        NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
        __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
        __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
        __ARC_SIGNATURE_MICROSOFT 0.000000, __AUTH_RES_ORIG_DKIM_NONE 0.000000,
        __AUTH_RES_ORIG_DMARC_NONE 0.000000, __BODY_NO_MAILTO 0.000000,
        __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
        __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
        __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
        __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
        __FUR_RDNS_SOPHOS 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
        __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
        __HAS_X_FF_ASR_SFV 0.000000, __MIME_TEXT_ONLY 0.000000,
        __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
        __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
        __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
        __PHISH_SPEAR_SUBJ_ALERT 0.000000, __RCVD_PASS 0.000000,
        __SANE_MSGID 0.000000, __STOCK_PHRASE_7 0.000000, __TO_MALFORMED_2 0.000000,
        __TO_NAME 0.000000, __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000,
        __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 7%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2022.4.5.71219
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB8EUR05FT007.mail.protection.outlook.com (10.233.239.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Tue, 5 Apr 2022 07:53:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (104.47.6.51) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 05 Apr 2022 07:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKolW8o7jutIGm3nC6Osd8aEsDNkIyMw7aqdr9ye8OlPkoXGYEmwT9goMGJn25ublV07nM8zMxZjCzDaMxCK/krLD25GmBWemIM410SqGENA4s9WplhSIJrg62g+TZYkgbzWrosNw9eZeYUzvGZD9F1MP4rTC8fGFpnYnhawzuVYXtLCEI4BST/WzSqRHTQVAqxZs6md+dbuHLR4/Tm0owSsZZ1kjcYTNdApEQH1ANuKxuCtnEGURzmp4ef/3JRblhpdn2WkmSqZlcPds3H4iIjx8gkNowlYBWKPVtkLXESOAIHl2jUap0o59DERmt+JXOcYOQ/cCP9YtPRPnY09FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3AvRmQTA7v+lzqrYHnFDKnyoyv0CCuYoQ8+oeNypto=;
 b=T2Z6J7gb6OlOYfpOFPnW7GjIG6TM1gNY4+QjRap1IfRNJQSDa7cu3LVqpg2ac5D4irRvnXV7MT0eDgkbDum1akGV2jI9ZZ/3jaRZjw9B1F9vEVLPgRojWq0CMMwwFEPLoEARKmp4lbA1aohrjrwB/wdTJ0i62eHuzt67WKbUd4MC+DvrVgFDwSqZ8w0naWxfcAd/8QTOYIPodbz2vvh9bxqs+n+4mV2BwZKvJIJRC64st+jHMYvT3w1ORxehTEsSkz4VZJh5jOA1XtQtcOcdl8Esj6g7etiaBGtYO28PODz4TRfmzGJ2v4ATFpupZj7ut8CR/9QhxEPJDQz0LWwUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by VI1PR06MB5696.eurprd06.prod.outlook.com (2603:10a6:803:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 07:53:16 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::54f7:67ba:b788:d301]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::54f7:67ba:b788:d301%4]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 07:53:16 +0000
From:   Hager Stefan <Stefan.Hager@ginzinger.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: CODA MJPG Decoder Problems after Wakeup/Resume
Thread-Index: AQHYSMH9Y2aeYuQSy0e3FAtXCa3zHg==
Date:   Tue, 5 Apr 2022 07:53:16 +0000
Message-ID: <AM5PR06MB315348317AD584BA4709B37584E49@AM5PR06MB3153.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
X-MS-Office365-Filtering-Correlation-Id: 30635054-1c2e-4991-d03e-08da16d95961
x-ms-traffictypediagnostic: VI1PR06MB5696:EE_|DB8EUR05FT007:EE_|PR3PR06MB7049:EE_
X-Microsoft-Antispam-PRVS: <PR3PR06MB7049221B46FBD7FE3345E1C084E49@PR3PR06MB7049.eurprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4bqUeQG9pLJKcjTxfo1TyLacyduB1x2AF8BBODjKfw4Q192V/YxcBWh0KSS4mL9b3ohfdVKK/y82WB+lhVramfd+SgkHVyG8Qi+lcqoK0UbKBkAyrpSLFfzL4E9qJrAd2WBj7/NlARh2XdZM7WpX0RANrVLGKNmGyhDXTowe9EhAG/dFrxBGtuvp7+Yhs4kbIgrfcKobeJzwnMW+5reznnPinh3coRwtHA3S7Nq7ifgb1yNaFs8iiNF0UwQ5QYqmAsEjYsx56EuLzfRYCRlpqCBn40x8T3VCE00v5/uwDg+ZiCEuhvuIPMgpXpOqIUQIYVAllY9Ni+rRi0YPRcN11b/sG/4krCkaNlV2/3Qtqziqr4KnX4UZOONTfW0LBT0udExle5Px81YVGv+9B+sdmXARndH2X9aAmEH6uHEO38txy1UDDlSMYmR6mk0KO/RkM0hUdszOVaFiy2nGO1PW9STwZK7c9vUp6pYD2HPTEcFNx65VuQjw97D0V1JoGSixtM/TE3UIiDh7WTyBzKBfHHHCxZL0Rb1ZVw5YH+8c/R6S2QFKy1OObfinzVriOTOtNd/uDuIKwqxktaGqMKIGnRRl4vbsv080iYRpql6W87TggJCP5Z1pyaB3nlyzDJFyrnfwthAHect3JD6XsaAbrcG8jbq/25YnmOLsWX5E9KSjAHurLPtS68Ew8vLm6bMiA3DqJ98VJAx3GzJG7Ekmdw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR06MB3153.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(76116006)(38070700005)(91956017)(6916009)(5660300002)(86362001)(33656002)(66946007)(8676002)(66446008)(186003)(316002)(38100700002)(66556008)(66476007)(26005)(64756008)(7696005)(6506007)(9686003)(2906002)(8936002)(71200400001)(508600001)(52536014)(4744005)(122000001)(55016003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5696
X-CodeTwo-MessageID: 11dfd084-3786-43eb-bb09-19dc8610ccf0.20220405075318@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a535537-aa5a-41f5-b4a2-08da16d95823
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwU8h2ToCd3FkdeIdPvVnmy05NYvaTpvPzGtH86ne7t0ctDYqiU4/eIGMBMnRs3gOqVHN7WyilHkqt89BIWJU9s7row2Y6mC1WfAOXWwUiaH1CLrBEorw/9GQnLxgIeGhAiu/ySFmcP7IFREYUro42lXDuMlvXp91XqxaGfBHg9Nh8Ymja94fE1bJw4KPNXFKSj2eRyayfYCjmm45Ug0FPDvbYsWWxZQ7mEyDT13IestFD4FyyxVkwjbh2+35K5Q+KiWBBPhjpbEpZ/w9y5SlE7cBtfRLdPRJUdg9mzJBhZrDh9ZI2TbLqo/LkfA97rhdmbnzDbHNJJEu7l8B/kynd7tQfjGPoHbgacWfaIC6B8MhPMsKUqjJIaAlr4uaoF6bJL+IzGhAGXxLtuc9+SUCavTt8qlROCU9G30lAwtTLnqC9Hk+tQY6GNhboMQ3dnl73pu0DRZWll670Xq/3IjHrO73XBGvTHku2TNAZ6jcDijqdhVOufOdLcoYGnSzyjVg0E+uYOfG4SFan6Kwmcf1bYK+5DqLDfe8nhhzjYorWN3B2uwn389Ytqwk6LyANG2jwM6/DPRCA5Yrt/wWcvqAofgUiLOUWp3rOu/CSQJmnxjs1pXt42o8vMurp7XZfCBCJx66qFWxD4TpIdtyv3h6henpFy6dlghjySpIYRVOHeFqwnepHcRHO6mDkTvCglr
X-Forefront-Antispam-Report: CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230001)(4636009)(396003)(136003)(376002)(39850400004)(346002)(46966006)(36840700001)(82740400003)(7636003)(7596003)(70586007)(47076005)(316002)(8676002)(70206006)(6506007)(2906002)(40480700001)(55016003)(36860700001)(336012)(356005)(7696005)(33656002)(9686003)(186003)(82310400005)(4744005)(52536014)(86362001)(5660300002)(508600001)(26005)(8936002)(6916009);DIR:OUT;SFP:1102;
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 07:53:18.9174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30635054-1c2e-4991-d03e-08da16d95961
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7049
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

I observed a problem within the Coda MJPEG Decoder:

An MJPG Stream over Ethernet is decoded - and displayed to a screen afterwards - with 30 frames per second (as sent by the external source) on am i.MX6D 2 Core Processor.
If the System was then sent so sleep ('$ echo mem > /sys/power/state') and woken up again, the stream is only decoded with a framerate of about 1 frame per second. This happens on each wakeup.
Before going to sleep there were 30 Interrupts per Second on the Decoder, afterwards only 1 per Second. I also observed a kthread worker taking nearly 100% of one Core.

What could be the issue? How to resolve it?

Best regards
Stefan

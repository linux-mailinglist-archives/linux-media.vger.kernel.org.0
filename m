Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4965FBE7A
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 01:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJKXmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 19:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiJKXma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 19:42:30 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E274DB5A;
        Tue, 11 Oct 2022 16:42:26 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BKwYR4027885;
        Tue, 11 Oct 2022 16:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ceS0WkLJGNziS9BUaGX13UG3dRz+lV34erxuUnw1nRQ=;
 b=cQLQWugbfdXqGl1U4Pokx2HrrWvRv3SZdfIPzp/31Zf+xXA6VQgdobSmB8a+s6iNDRZY
 KBeommWwz1x4tJoEIoW7YcMIkHfHSATnLZuDJdeo9raCWS833LT0HiYa+hh3+XHbQ1bw
 7DKAh4tPYg7OqaFeg1jn+YTMIw3ThpZgevbc+T6pIHXktChXh72qQnexRjgb7HA+Q7Qb
 djXMMzu/FVIaBrgcrQYcy20VOO0Rv9Lp8IocluMwSqtWv6uh+4npehnmTASMQGtUWsmN
 4OwXOxVTl2gZXZAKygPKg5WnZZS/0dFE5Owp0/BnuzQI97XsHPucpQ2XWn0To8cZ8wD2 UQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3k384tt6fj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 16:42:05 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5AEF3C087E;
        Tue, 11 Oct 2022 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1665531725; bh=ceS0WkLJGNziS9BUaGX13UG3dRz+lV34erxuUnw1nRQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QSkMt6rMieFPdUxhJkT4Dl1pw/AWM9gV3L1ITow3UE/QyaDRdKwzhIbX9+kzWvYvq
         2bhRPiOoztelh2fk6qxFg7XgAQcQ7nfGw+ZGcqFmzBGgffwU1jiB35tzM3jEW9H9Gu
         wwi/V4FOaIbcRaWIQBoOljUJ2LYRtGn+iwhJBfr1T5Xxl0s05t3F7SCLeNo2dbIDAx
         hghOPUx7fgXBIdM0N05RnlVhwax9mYE9J6gZ0TnI7RySWQKaXBbSKN7ghkCAHBiI+5
         s0UFL2ATq8trwP+fpYMmbSBWemxIvAMykfWPl63kvrejg4rbteObd/IJ7BDcZQcMCh
         /HQFm+ffUsgsw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 336DFA0080;
        Tue, 11 Oct 2022 23:42:03 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E4878128A;
        Tue, 11 Oct 2022 23:42:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="aiOujoyV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIdBaMO6ANEu/5/RS/NmD7Dql66PZkkjEkRKYFyqfoqgMBn7YYhueH/SvdmaEL7Jygi+yWOwKE9T0FaqMKHYFR+JCYTkZBsCUJBNdVBYvRGmiUp2ik9+zOcUdOb9YX++pxiFgNT2OPmP7t01PE0Gv2Gm36HYo8VV/2MsJCJ+DUnBi284bSLpfwC0xucYt8QWSZiN7Zp9fdiYirOk3VMmUsF+2BHED4xYti0XFJRXnw/7QLcJQCT+KPoGz57PEDaKfe7Tx97zKreWBnzsxpQjDWBCi5iEIW+sT1HtL/OD0R3Wq3t7TEoep/84Guqxvzp9v/R1g78YKRlCpTPplXo+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceS0WkLJGNziS9BUaGX13UG3dRz+lV34erxuUnw1nRQ=;
 b=evpytoMKyZ7Te7lcz6YAEmk0K/hrsPi+Os6qfpcrscxdN9q31uHn1x7ebqfJgNwBi68WcOmHwcYrfrnYDbROWdcT3wAW1+ixI62vHv3ho5jzmhtDiaAu8l+U86yl3jtGd0f9cy/gAA5ZNS+mymKzy8yyjX/nfKclAg+FlchY0tyBj6HLEiuYwlz+rEEShutOWxnpomxRs8SjKJMnrf9nNVx2P8NaS+5CyPY+MyLpyDbGtdgJcoZmsjCxYuXRKzB3SNr3sT9xIPVh3/qweDZ9lpCnQlnJh42eDByh93Nia0XTGVwEKLJYD5E3ViCQ+Kx6a59L51wmaz7XGUXUml1k6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceS0WkLJGNziS9BUaGX13UG3dRz+lV34erxuUnw1nRQ=;
 b=aiOujoyVzk2w5EjAZdy/ddH3elQLH3IEZj3W7/2uDfVdUnLPd1Ue8KqmF+XXsNFURTWb9sXA+nsEfR+ANsqhTT32JsATxFpurLODgfgEMfpER7QsGtrlcbnziyNipjuGbMEdaz/v8YncearQ2WS3NV3+HQ2eyUsVtnireCT6FDE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 23:41:59 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::525b:92b6:eafc:8629]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::525b:92b6:eafc:8629%7]) with mapi id 15.20.5676.031; Tue, 11 Oct 2022
 23:41:59 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Thread-Topic: [PATCH] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Thread-Index: AQHY3bQPvXcs3CJxOU6i9cuq4l5oh64JtqUAgAAj/oA=
Date:   Tue, 11 Oct 2022 23:41:59 +0000
Message-ID: <20221011234145.xzy4466z4tl4ygp6@synopsys.com>
References: <20221011205707.1603017-1-m.grzeschik@pengutronix.de>
 <20221011213256.GI27626@pengutronix.de>
In-Reply-To: <20221011213256.GI27626@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN2PR12MB4504:EE_
x-ms-office365-filtering-correlation-id: dc4b6c2b-f99b-42d8-eb8c-08daabe230be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8IFGTpqo20Ro0JDiLuJifxJHoNhJPvCF+K76f7vy5FbeDx92/Nyl/xpPnH0vhHGjRac3sjN6luZPHz3nCqNcrLmf0miNguqew/5xq52hbkex2e3ECA9hm72RThdC5Oy/DCTnHfCrzqpeStUjBZeLgPB2ZHMo4R+XVWY7cRZ/ghvpmtZKx22dOSOsY+Owrtz/kjlewipZ37bbAAncZtwFp/7gbOCagWECYy3PwuYlN/UjDeBxH7AycBU/yXnfLjT38br2zp5QHdiL/OS5H9feEeV6IJYDu0zcVycXlFrtrM7ygbNFbkSwQKV68B8O7yRKhwLXuyY1BwiSReO2BnAIGzDlgcAqnR2wV5UTICdtB0bBRlE2dKQd5QIA/1IXOWBLS2xGFC2lg0NpjgrsTDHHwz4MSmY8S+Gas5Xi58/znECuXD0BBL2UZlfh5inDjmf+J3r/FT1XD1bFH5RXGibEgK90RoP3qEepQpw4COeM8PJ+xNdI+NWrjyanAR527T3uoW89K+oD7K6GerYav9gaidVegRdny6iTbrk/eaeRjjE+L3hZrBsshJxuym217mTOTJG7uc5CIbdu/Ov3ci0zsFY63VP9xqtLJb6BUnKLdlitGHM2xBjxgRFZc0QE89EQnhSq7cF4uPIorsdSwhwptKnIJTOEIDJavZW1o9i5+qjPIc1Tui8dQ3obhismW5dnMt7obI8Hs/vNSgodeuCbRj+D6iUlBz6GSwFuaFd/VcSWUeVWmzOUU/L88T73lvoAhN6iMbn/bcaQI87vB+9s6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199015)(71200400001)(478600001)(66946007)(316002)(54906003)(4326008)(26005)(6512007)(76116006)(6916009)(8676002)(6506007)(6486002)(66556008)(2616005)(1076003)(41300700001)(8936002)(186003)(5660300002)(83380400001)(66446008)(64756008)(66476007)(2906002)(122000001)(36756003)(38100700002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3NUdmdFVk5VYkZ4aXJWZkhqbTFOV0VRZFV4WnJNbjhkKzFTaUd0cEFveE00?=
 =?utf-8?B?U2RnYi9KRk5VdW9nZ0VPSWpMT3JqUS9OY3VwSitkOVRWbDRQSEZVRHNrbXpi?=
 =?utf-8?B?K3FxM3k0ZUYrOWhVOFR3c2gvNHg3cFUyaWtmYTBYVStRb2hIY2t0WEtDMkpz?=
 =?utf-8?B?cDlOR1paSDNyVXBQSHJ1ZWcrRkxUZU93Ukp0M1ZkL3VjR2NHQmF5bDczaWZo?=
 =?utf-8?B?V0xyR2Y1MjlHdDVOZ01sWmxtVTg1UWJ5aUM5UDduc0RyZWswSW1HM3BtcHhh?=
 =?utf-8?B?Y3MvY2ZJbER4VmYwc3R0Wmg5SWl6TjlwVVZ1YWxERTgrVFVna281TmJoRHI5?=
 =?utf-8?B?NitYbnRtRzQzR3JYVzB5NnJiRU1yZFJFUUh1ZDZEcDkxNGJhREtZdHRzMUJm?=
 =?utf-8?B?djdidjAxTCtqRWFtc2wyOE9ZdkcveTFKbC9uajZqcXZ6WHI0S204cFlCUmRs?=
 =?utf-8?B?QVpWY0piZncwQ2ZqaFRrZEoxWnNDcVN0Tnl6dVFyTGtEb1RxNXE2SVZBZkdB?=
 =?utf-8?B?cFJnSzUvQUR6N1FPTWg5UHBwdVNHeUs5M29vbVQraTFQVVNzcy80SWk1bGt5?=
 =?utf-8?B?RUdZcTJUQnoyeTJoTkRQb0kxVUQzYmd0ZFRSTmErbWFYZHdOK1d3ZG0yek10?=
 =?utf-8?B?Vi9GdVA1eDhNWnorWnhkQmlBSlRqcHIvVzdkMjdQMjZDdGR5MDgwZzlOOUdq?=
 =?utf-8?B?cnlGK0pFakZWMzlGM2JVY2RQWjd5bkVIOGpMRXRiOUtBNnNoUkloTWM4UjhY?=
 =?utf-8?B?dk9wZzg3cGpmR1FPSm85S1N0SHdJZUMyNmFhUW10YXk5aXZnZ1ROQnFTRHdW?=
 =?utf-8?B?UG5UV0xITmpURnNyeUdLczE3OTIwV1JIZCtqM0pqLzV2dGJmcllZS0xpQjhs?=
 =?utf-8?B?b2xjR2hJaituZjJKUnYveUpZYm9XRkhVMUJOZXVpeXpFRS9sQ2tZQURHdVdZ?=
 =?utf-8?B?aUlSaHVrVUVkOEVYVkJFSWc3SUdaWjNpSVFmbkd5RU1MdzV0dVNwWXZiZjdR?=
 =?utf-8?B?WUtGS1BnYlRtZVZUNXU0V2R2bEQ3V1Z5WmRxa0dVdFY0dkNZSXZWNTIvZUFs?=
 =?utf-8?B?Ny9kSThjRFdOVDdCWkFFVk1BR2t2SEREQWlZWUVyRWpVMXdHaUdhTDluYVdI?=
 =?utf-8?B?VFZ3K3VwYXl2RFY1VmNrY2JBTElycWw4cXFqSHdBNUVrM3JqT2MzdGJ1SC9h?=
 =?utf-8?B?T0c1c1hpNTVVTFA0dHEzcTEreGhZa1hORUR0RldkMHlBNW5GTlZrWmd6WmhN?=
 =?utf-8?B?TkRTS3Nsa29rQkdqaWg4TEx5V3ZiSFNQRHNmTXhjaXd2bUFvdUlTZUFGOXpF?=
 =?utf-8?B?ZUNRMlNOdy9hdFdOK0pMRHJvWXRqY3pZSUVRMmtHVm90S3lEYjZSVFdVd2ow?=
 =?utf-8?B?QzJBdmh5RHpTbVlvRDEyR1U1YXJOWEUwUXpCSHJVQ0NFYkxERFVtS2ltVTA4?=
 =?utf-8?B?dDQzRzVoa3FyMHdOV2IxeTFzQUlKQTRVeXJrOGQvcUhuN0VpaTVlSHBsRmdU?=
 =?utf-8?B?U2E1QkMrcys0MkZXUWdGNDJiUGRMdit1M1JhYVE5ams2a0g0NWhFeUQ2NTZw?=
 =?utf-8?B?aWpCU1kzRFBBbDNYVTQ5ZmdZSFcxSU1qU0dTWEN2aXkyMU9UTzcwc3lSbVd1?=
 =?utf-8?B?U0hFS3I3KzhidVRiTG5zUUJjRDhUcjBXaUNTZStNVGtLWEpMVHoveHBFMXAw?=
 =?utf-8?B?LzJhTGRXQlpQWVJ6K1JMc3lrWmQwd1N3STMzRFEvQ0RhUlVZcEdmallCZnlj?=
 =?utf-8?B?djZtQXZ1ZHJaSEJUellNRzM4RXh3MGU4QkhtUTkrd2RVUnhWanRmeFpxeW0r?=
 =?utf-8?B?ZVF5cnpkSHZuTlFpREprOFVjeXA0Q1VJbkFvdUpTa2pLNVAvc0NOYTdpQkFO?=
 =?utf-8?B?c0lhWTc3SEx3WTluQjFiMnFKdENYQTJoeDRsbkhKNjZLWGwwMlBGWnVYT2xB?=
 =?utf-8?B?czVNeWxjMlo5a2pwajZ3RU9nRmU0R2t4eTBPWS9CcXpzQllGc2UrWlJvSzBN?=
 =?utf-8?B?NEQ3SCtqc2xpWnU0b2Y5NkF0a2RUU1lsRzcyN3ZEV1VJczRrZHNQZTRETXdR?=
 =?utf-8?B?aTBoU1d5dHBCYVQxQ2srR0N2MkVWeGRuZ3QvQnBOanE0d1R5NjViL2c0cjl2?=
 =?utf-8?Q?/moqqDKQaGTrnoiBflCG9iijv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1A008D5DAB48C46BC2DE94AE7FA7B25@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4b6c2b-f99b-42d8-eb8c-08daabe230be
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 23:41:59.4498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crrxU8I2bvlfOQn51xKKozgJunY0di9qf5PS7Jfw80cnsAp+QaoMQCW9CrJeTG25VVYbX3RW/9KO1C6e5nr0KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504
X-Proofpoint-GUID: xdkoFpwp3gQSpvAzX6ifWe0GH0sHErZI
X-Proofpoint-ORIG-GUID: xdkoFpwp3gQSpvAzX6ifWe0GH0sHErZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210110137
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVHVlLCBPY3QgMTEsIDIwMjIsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBPbiBUdWUs
IE9jdCAxMSwgMjAyMiBhdCAxMDo1NzowN1BNICswMjAwLCBNaWNoYWVsIEdyemVzY2hpayB3cm90
ZToNCj4gPiBUaGUgb3ZlcmhlYWQgb2YgcHJlcGFyaW5nIHNnIGRhdGEgaXMgaGlnaCBmb3IgdHJh
bnNmZXJzIHdpdGggbGltaXRlZA0KPiA+IHBheWxvYWQuIFdoZW4gdHJhbnNmZXJyaW5nIGlzb2Mg
b3ZlciBoaWdoLXNwZWVkIHVzYiB0aGUgbWF4aW11bSBwYXlsb2FkDQo+ID4gaXMgcmF0aGVyIHNt
YWxsIHdoaWNoIGlzIGEgZ29vZCBhcmd1bWVudCBubyB0byB1c2Ugc2cuIFRoaXMgcGF0Y2ggaXMN
Cj4gPiBjaGFuZ2luZyB0aGUgdXZjX3ZpZGVvX2VuY29kZV9pc29jX3NnIGVuY29kZSBmdW5jdGlv
biBvbmx5IHRvIGJlIHVzZWQNCj4gPiBmb3Igc3VwZXIgc3BlZWQgZ2FkZ2V0cy4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8bS5ncnplc2NoaWtAcGVuZ3V0cm9u
aXguZGU+DQo+ID4gLS0tDQo+ID4gZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRl
by5jIHwgOSArKysrKysrLS0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQv
ZnVuY3Rpb24vdXZjX3ZpZGVvLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdXZjX3Zp
ZGVvLmMNCj4gPiBpbmRleCBiYjAzN2ZjYzkwZTY5ZS4uNTA4MWViM2JjNTQ4NGMgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRlby5jDQo+ID4gKysr
IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRlby5jDQo+ID4gQEAgLTQ0OCw2
ICs0NDgsOSBAQCBzdGF0aWMgdm9pZCB1dmNnX3ZpZGVvX3B1bXAoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQ0KPiA+ICAqLw0KPiA+IGludCB1dmNnX3ZpZGVvX2VuYWJsZShzdHJ1Y3QgdXZjX3Zp
ZGVvICp2aWRlbywgaW50IGVuYWJsZSkNCj4gPiB7DQo+ID4gKwlzdHJ1Y3QgdXZjX2RldmljZSAq
dXZjID0gdmlkZW8tPnV2YzsNCj4gPiArCXN0cnVjdCB1c2JfY29tcG9zaXRlX2RldiAqY2RldiA9
IHV2Yy0+ZnVuYy5jb25maWctPmNkZXY7DQo+ID4gKwlzdHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0
ID0gY2Rldi0+Z2FkZ2V0Ow0KPiA+IAl1bnNpZ25lZCBpbnQgaTsNCj4gPiAJaW50IHJldDsNCj4g
PiANCj4gPiBAQCAtNDc5LDkgKzQ4MiwxMSBAQCBpbnQgdXZjZ192aWRlb19lbmFibGUoc3RydWN0
IHV2Y192aWRlbyAqdmlkZW8sIGludCBlbmFibGUpDQo+ID4gCWlmICh2aWRlby0+bWF4X3BheWxv
YWRfc2l6ZSkgew0KPiA+IAkJdmlkZW8tPmVuY29kZSA9IHV2Y192aWRlb19lbmNvZGVfYnVsazsN
Cj4gPiAJCXZpZGVvLT5wYXlsb2FkX3NpemUgPSAwOw0KPiA+IC0JfSBlbHNlDQo+ID4gLQkJdmlk
ZW8tPmVuY29kZSA9IHZpZGVvLT5xdWV1ZS51c2Vfc2cgPw0KPiA+ICsJfSBlbHNlIHsNCj4gPiAr
CQl2aWRlby0+ZW5jb2RlID0gKHZpZGVvLT5xdWV1ZS51c2Vfc2cgJiYNCj4gPiArCQkJCSAhKGdh
ZGdldC0+c3BlZWQgPD0gVVNCX1NQRUVEX0hJR0gpKSA/DQo+IA0KPiBJIGFsc28gY2FtZSB1cCB3
aXRoIHRoZSBmb2xsb3dpbmcgSWRlYToNCj4gDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICEoZ2FkZ2V0LT5zcGVlZCA8PSBVU0JfU1BFRURfSElHSCkpID8NCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmlkZW8tPnJlcV9zaXplID4gNDA5NikgPw0KPiANCj4g
V291bGQgdGhpcyB0aHJlc2hvbGQgb2YgNDA5NiBtYWtlIHNlbnNlPyBXaGF0IHNob3VsZCBiZSBw
cmVmZXJyZWQ/DQoNCk1heWJlIHJlcV9zaXplID4gUEFHRV9TSVpFPw0KDQpJJ20gbm90IHN1cmUg
SSB1bmRlcnN0YW5kIHdoeSBTRyBpcyBiZWluZyB1c2VkIGhlcmUuIEl0IHNlZW1zIGxpa2Ugd2Un
cmUNCnVzaW5nIGEgc2luZ2xlIGNvbnRpZ3VvdXMgYnVmZmVyIGhlcmUgcmlnaHQ/DQoNClRoZSB1
dmNfdmlkZW9fZW5jb2RlX2lzb2Nfc2coKSBvbmx5IHNwbGl0cyB0aGUgc2luZ2xlIGNvbnRpZ3Vv
dXMgYnVmZmVyDQppbnRvIFNHIGVudHJpZXMgZm9yIHRoZSB2aWRlbyBmcmFtZSBoZWFkZXIgKyB0
aGUgcmVtYWluaW5nIHNpemUgb2YgdGhlDQpkYXRhPyBUaGlzIHNlZW1zIHRvIG9ubHkgYWRkIHRv
IHRoZSBvdmVyaGVhZCwgbWF5YmUgSSdtIG1pc3NpbmcNCnNvbWV0aGluZz8NCg0KPiANCj4gPiAJ
CQl1dmNfdmlkZW9fZW5jb2RlX2lzb2Nfc2cgOiB1dmNfdmlkZW9fZW5jb2RlX2lzb2M7DQo+ID4g
Kwl9DQo+ID4gDQo+ID4gCXZpZGVvLT5yZXFfaW50X2NvdW50ID0gMDsNCj4gPiANCj4gPiAtLSAN
Cj4gPiAyLjMwLjINCj4gPiANCg0KSW4gZHdjMyBkZXZpY2UgbW9kZSwgd2UgbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugc2ltaWxhciB0byB0aGlzIGZvcg0KaG9zdDogMjAxN2ExZTU4NDcyICgidXNi
OiB4aGNpOiBVc2UgdGVtcG9yYXJ5IGJ1ZmZlciB0byBjb25zb2xpZGF0ZQ0KU0ciKS4gUmlnaHQg
bm93IHdlIGhhdmVuJ3QgbWFkZSB0aGlzIHVwZGF0ZSB0byBkd2MzIGRyaXZlciB5ZXQuDQoNClNv
IHdlIHNob3VsZCB0byBiZSBjYXJlZnVsIHdoZW4gc3BsaXR0aW5nIHRvbyBtYW55IFNHIGVudHJp
ZXMgKG1vcmUgdGhhbg0KVFJCX0NBQ0hFX1NJWkUpIHdoaWxlIGFkZGluZyB1cCBsZXNzIHRoYW4g
dGhlIGVuZHBvaW50J3MgbWF4IHBhY2tldA0Kc2l6ZS4gVGhlIGN1cnJlbnQgVVZDIGltcGxlbWVu
dGF0aW9uIHdvbid0IGhpdCB0aGlzIHNjZW5hcmlvIHlldCBiZWNhdXNlDQphIFBBR0VfU0laRSBp
cyBnZW5lcmFsbHkgZ3JlYXRlciB0aGFuIHRoZSBlbmRwb2ludCBNUFMsIGJ1dCBrZWVwIHRoaXMg
aW4NCm1pbmQgZm9yIGZ1dHVyZSBjaGFuZ2VzLg0KDQpUaGFua3MsDQpUaGluaA==

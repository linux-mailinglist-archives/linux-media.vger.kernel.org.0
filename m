Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD336DAF8A
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 17:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240798AbjDGPPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 11:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240668AbjDGPPU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 11:15:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9498EAF26;
        Fri,  7 Apr 2023 08:15:10 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337CqFNb031411;
        Fri, 7 Apr 2023 15:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=hKa2r1JKG9sfCKuM5aB/XPWHIyz1dnMUHUSYYuBkRS4=;
 b=DvHyE5ljyV4y8wpakanQUFmQIHmGAj9rtqiUJV+Q62Nek5R0aKUU8yt5aaGFFYB3AObX
 /1RYct3WSmlGWLyoPLiI05zZxaEWMO2CydOz4CVAMLWJ/4ZdzYuCdH2Vlwcm35ES2yMN
 KqJ5ZzgmqzUx8wTVYK4utciARlas/J4efNikrMhdUGUKmyl5tPrTLg9HJtQEtQ6E9kM7
 iJAzU+TUdrICdnEECipePAqrs6BnauPjVI2qmsPgycC7RXPgdYG73G+ckBx2OHK61qI0
 RyuZusDMfk+/cx3WLv3uhsqn3CZeNi2ULl2HyjqZHeHNlOUIwvh63T4qrVpsfAJGwlRF iA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ptb9wh7hm-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 15:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6ccd4HZaV0qQT9M03Ca9zsIxjyOD7DV7ESr5vZ5xG1k6PkTjT/8TyMf2gdafoSzYyvovTNvooSyN9f5vmRBGWkaWwptwXLT9Gu310cCs/WhPuSTQ9Q7dReT9j6e6m+DNgFFj//kC+VmrrZ9ija6Va6oibwgnplo1RP7C+iv8nEkMTzYbvyod3gayTWTn3ejApJtdZMb7HKg5M8NwwPJkcRe7hzkPE58RFKpOLXqtV6gvNwAwBl3BhRRQT86i9T8OneeC7L31MKOBye/IJZyGoQ4BY3FdbZ/c4NBbql1TzuOpSUD3VpE3lGiWsQRSWWdXET/6OeWPUSBbSaWaR+2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKa2r1JKG9sfCKuM5aB/XPWHIyz1dnMUHUSYYuBkRS4=;
 b=UjPmqPZZ1Y42EzohNEZ5CeW4Ur86erybfpZrKafMAgXZxVNaVRQuBLgySwYfcMyHLq84/oGDUQz8IbKCWvjqPUebRhd0g/mZrEPguHJzbm9r9ibnkr8mZn0stvDOhLSxF0Rlo+J/TRSVw2Xicps5tyQIdZ5oY7Ci8wb8fEsEfyVtTml14wb037I1qfWPPS6Iy02S7HnsEYcVBS21Q+6PBtl8zb1mnz6NFolcdilA4oWxLXhbEb5OU21YroX6YcGBNhG8LYMiIeKRp9Fc9ookDamn0hR2yZ4iNgY1K/65+IPOzUfzS3iQCNEIIUZbYEYGWnf8TW7e1m+CV5r+3qpEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5575.namprd02.prod.outlook.com (2603:10b6:a03:a6::24)
 by MW6PR02MB9768.namprd02.prod.outlook.com (2603:10b6:303:245::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 15:14:55 +0000
Received: from BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::4e4:ba3b:69b6:8f14]) by BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::4e4:ba3b:69b6:8f14%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 15:14:55 +0000
From:   Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
To:     "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>,
        "Milen Mitkov (Consultant) (QUIC)" <quic_mmitkov@quicinc.com>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Thread-Topic: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support
 for SM8250
Thread-Index: AQHZZsa99JXOerW2fkivkNlORTwu9a8f+Rug
Date:   Fri, 7 Apr 2023 15:14:54 +0000
Message-ID: <BYAPR02MB557584CC90E07DBBA5F8CDC1C2969@BYAPR02MB5575.namprd02.prod.outlook.com>
References: <458d2d7d-74bd-dcb0-6cb7-74fe6e527131@linaro.org>
 <c8420c54-4f2b-c259-c5c3-29078ac0c9e6@linaro.org>
In-Reply-To: <c8420c54-4f2b-c259-c5c3-29078ac0c9e6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5575:EE_|MW6PR02MB9768:EE_
x-ms-office365-filtering-correlation-id: 34e46564-5489-4baa-bbac-08db377ad7ae
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lvAF4pzusf8paSAX9pPODHoPP/H3Ybwi96p1swhWK0p3BXnyFJ7tGuGitMvCX1gVxHVShZzdrpbvVreXIWpIYknAgK72q6ssXzKfTYrZrPmwO17i6Oq90tfAUiPpRniWtM6a+BL3vhGx6jaXBZ2wmjDgJmmEirMfQ06TiJKQ+8K8cf0KhHoWHWNhILqF+xc57j8QVPgsqvJ5hcqUx4YgHnJIRC33MAxWsOBHvRxUAB8Kspe2+7ztjNIW/XhwoVq8h9hl2yTGDz1bXPZjxuT0A+BKnQci15fy918nuK3Qak1wvBPXDDMZ4MZfxid9EZZDA1BJ5JP9X8u0hSJIKX3YJ2DpAqjTkstE0srv25XF2DrM+pph0s7VhxFhSlw6jwKLxelZ6qF6apmVR9pBacDCyFXaEKTmjtK2qBj0PGQLnBsg6wCPfknEqTq1SjPs4zTDACjFELUhddXCtU62ZEohHcblRku8As/YVc1faVBC96EWo7nSPGgaTC8GVmo2eyzKCLJRAkJAw2yIFPPWoOn5eZxSMDmW0xwc+h+WBLBvVRiYeTRKQmmxGl+dnT7J3NVX1Km/DV1HPFiylqustxW5PJs4Vo7wbLklUO0qp6ewrnfATaMHJ7p842qlCVu17acl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5575.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(2906002)(122000001)(38100700002)(52536014)(8936002)(41300700001)(5660300002)(38070700005)(478600001)(66476007)(66446008)(66946007)(76116006)(8676002)(66556008)(64756008)(4326008)(110136005)(83380400001)(316002)(6506007)(53546011)(9686003)(7696005)(54906003)(186003)(71200400001)(55016003)(86362001)(33656002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlNNOHJyTXA1TzMwbUJNY3FSS3d5NlZ4ZWhTaXVaZ05qSldsdHlPSitiTjdJ?=
 =?utf-8?B?YzZ4YmNxOGRkZUJlK2ZBb2VGZDlTZUNXYVhWOUhseUpnSTIyZCt0SE8xNzZy?=
 =?utf-8?B?Umtkck1zdWFkSllnOHJ2SGFTMDZxTGlOcCsrV0NZUTU1Y1Q1WUVFOHFUdlFK?=
 =?utf-8?B?VzlPZWZwQkRkMHBlZmhzcytDZzk3ZVpSR3VRdHJneG1SV25sV0t0TmRlNjcw?=
 =?utf-8?B?UTdFa1Brd2hMeXRVZGhIdXhaTDJFenJZV2NoQmNtRHpqakZuRUtzRjlNRXN4?=
 =?utf-8?B?WVNhYnV5Z3Jtdmdrdy9udzJqbzllU2lOWWZYZmdyMmlGY1Vjc1RwdVZvMU9U?=
 =?utf-8?B?UDRjeW9ua0dWOWxQL3J0bGdDaWZEdXBmcDllZjdSTXFHZ3ljd095dklsM2FE?=
 =?utf-8?B?VmxSOHN3NVdGRUk3RHM5VVNYT3VpYkI0bXByN3pMdjJndXVIaFZZUzB0anFv?=
 =?utf-8?B?Yks0UHk1T054UnhDQVNQZ2t1YmtMSlB2K24vakdnWmlnK3RsK0k5blE0azBT?=
 =?utf-8?B?QmhGV0VtWVVSOGFvYjJ4S0F1eUtKNVpZNmRFU3Bqa3poRWVMcjN6QjIwdTVO?=
 =?utf-8?B?UkxWd0lqclFSMlZtSk5hclo2QTFjWWRoSVQyOTRGNEh6NUpRNnUwWENpdjdG?=
 =?utf-8?B?Yi9FL3Y4MmJpUTQ0bDN1dWVHTXJUVHZYMDQ2U0ViUHl1bDk1bGM2VkgxTUxi?=
 =?utf-8?B?S2s1TVZHSENWZVEzNXpsY3dyMFhEMmYzai94M0lNVVJwT3A0dVJVNHp3VnhC?=
 =?utf-8?B?UGRBd1JuSGN1Tmcza2tGZWNJYjZHc2wvdWFGNGJKRDJOR2hCcVpoT3FHMDg2?=
 =?utf-8?B?ZEhtUlVVQWI1cllJamhPRENRNVJ6TDFJaEwxc285dzJ0QmVZaU42bVFCWmtJ?=
 =?utf-8?B?aVdvMlppVFpGM1NsdFFXODBXZitZK3pNM3o1YnZORUdUeUJ2dDhyTkhnVWsx?=
 =?utf-8?B?WGlzM2FKYTZsQmJZRk1jYWJUOW5WeC91T3g4RS9nWHdpc21Rbkh2N2h2RFkx?=
 =?utf-8?B?TUJJS3ZkZjdWbGoyZXFnZFZkVzlMcjh6VG50YlpCMW9FbXdZcUNabHMycjI3?=
 =?utf-8?B?UDZ3ZkdvUW5nQ0tBcEs4R0QrYndNMFF0SDVSTS9ONVJkY2RkalAxWTBzeUlM?=
 =?utf-8?B?M1pyN3JuRkY4SXZMK0VoQzhkcDJiSlUxV3MwYUt0RG82U3VGMGNyTWIrREhS?=
 =?utf-8?B?RVZlVzBjaUZET2RFQlpPWTRHaGxtTFRWVWovMHoxRGVEeHgxajIvSlFoV0xn?=
 =?utf-8?B?eGpoVDkreWV6a29ubGU0Q1Y1NnRqK0RRT2dZdk1TZENnNzlqWk9GNWdmaTN0?=
 =?utf-8?B?cW8yUENjdXFXYTFZazErM0F5SEN0elNKeUpNRjVhdzd6dnlzdkdJUXhHb2xo?=
 =?utf-8?B?MWVBK2RrVGFHcDRrY1dqZFBOeWlCV2k5Z2NEdVJGbkllaElNTnhqMElQUVpM?=
 =?utf-8?B?a1hXaklsMVdrQ2hpYlQ3bjVOUXVSQmZVdnNVTWxLcVd5N1F1Y2RHN2Q4N2NJ?=
 =?utf-8?B?VHhqK2NQdU82OGdSR2dKTG1NQkdaeTJydk9DN2llMnZWYzlleUoyWFRDRUZa?=
 =?utf-8?B?aStqQW82UE1JaWhKQXRSM0g3YmdkU2VGYkJRQ0xyTU1tMFBBdzZGNURocVlF?=
 =?utf-8?B?bGhvM1ROYnpMc3FUMGxFeHZsS3dPRi9zUVJIRS9QT09ILzJ5QU5XbjR0L3Jy?=
 =?utf-8?B?aGZrL1YyZnZzZXdQaGtITDdxbUtZb054WmFicXBoMTVjM0JsUU5zSS9IOUxS?=
 =?utf-8?B?OTIyYVBGOUt4VEgvR0FrWmVFVUhYR3l5M2JUeHFON0ZWekRJbUpGUmp5RWtx?=
 =?utf-8?B?MHpsajRaSnRieDhXd0J1a2FKZUE4VC9DTU5kYzB5OWZtb2REblhmeUFDNW0w?=
 =?utf-8?B?RGRTRGpTanducEpISGNKTUNBdGdOL1J5MGJXU0ttKzZ5SENwUzJrSmFwL2tK?=
 =?utf-8?B?UnJLM2crckpNTVJxNXZVUXFjRGlYODFnZGNOS1QrYWlaWmg2aG9pb3NPanZs?=
 =?utf-8?B?aDJBOE93OEZlZWhPZ2xxTDFkRDdGa1pSVHFVbXliR0VsTnBVS3FTR1NXY202?=
 =?utf-8?B?WmR3T1dodXdsQW02dFI2VXhYUm9iWElPREpSUGtiSzROMVZ3elBiNEJOMDFW?=
 =?utf-8?Q?xsIn69B9H4WyTCG8z29eFfeLR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?V0MyRkZuQm1OeDUzNXg0VllnM1NtOUtJZ29mOHY3RldNa01kSEVtZW1kTy84?=
 =?utf-8?B?bzNKMmZtYnlXUjF1NjZOYm5HQ2dHRHZEZ3g2aHNzTlhBT25qM2V4UmdsdC8z?=
 =?utf-8?B?THRBRG14aFgycmZsV1JCZkc1MGN2TkhaZzh2Uy9HNGF4ZmVzaWVDOFlCSnVV?=
 =?utf-8?B?UzRMbWtzWDQ0b0UxTG9xbWhYckhvNlV6UEZZeTFGWFU1VzRyMExhUHhGVVB4?=
 =?utf-8?B?M0xMVUQ2N1Ird3dsdWpOaTRUbTJ6RjZpcUpEUTVpdW5WUG1Gdk1hUXE4R0lV?=
 =?utf-8?B?ZTNMNjJWcnVOa0RCZEV0Z2tuZTRsS1dmQ0RPRnd3VitncGpRNGFKaXUwMU0w?=
 =?utf-8?B?VHE1Szdoa2RSblViNVA5emtoZWx1WHdXeWtZdDkwSWZGdlRqYmdZR0lod0VU?=
 =?utf-8?B?QXhvUnRYR3dKN1VUK1hUV095bExKcEU4eFZSaHdLWFZtSHpzdDJxSUN0NmFS?=
 =?utf-8?B?M2g4UUR2Ymt1V3VNUDZKdkpKdDVaU1p3MFVQMUR4Z2dneXJDWlZvTWRHN3k5?=
 =?utf-8?B?YmRVVXZDQUthcUR4dEFSS0x6cXc3NFE2SUhBN3hLUXpmQ25lNTEwNFkxNTRF?=
 =?utf-8?B?TVZrWFlWcTJ1YXhKZ04xUC9pUVRCQmR4SEpLWkkreXZxWnBQbFZCVUVCNyt4?=
 =?utf-8?B?cTRVblk1eVBTQ1hhZ0VYeHlZL0d4Qk5mdFJCS3BiNlQyVDJ1TjZyc3pvK0Nu?=
 =?utf-8?B?Q3VvWHFFOXpaaitMUVh2dFJCOVJ1UTFFUWE1RVNxT0x2NlBVTGNMbURtWFRy?=
 =?utf-8?B?WUp4Y3I2NmpoS2FrSHlpTU4zeTVzQnRBc2FBRE1LS04yeGprbjhGc1F1Wk1i?=
 =?utf-8?B?UDJMMUh0YW93NnFldm9LS0J4a1RIWkFBVkdTbGVibHQzMHg5dGJZRHlETkFq?=
 =?utf-8?B?RWFzTHhjVFFLb2xkdEtNMkhDNWFPT0M1TDdxQlhVMENNNFg1NWhXcnFPZG9n?=
 =?utf-8?B?SkxoUWVqeVlpektRTDl0MXlWaDFuRTkzYzBGUkwwTHB2U09EcmwxMzdMbXFS?=
 =?utf-8?B?cEwrMnJrVytoTHVkUGx6ZllHcWJkT2ZXY1pkRUR1dXVwSUd1VHNtUlFGVk1N?=
 =?utf-8?B?TUJteW1ybmlUcWVnVWtzUDEwOWwyRWdLRFM4NVlyQlYycmxFaGxibzVtSGl6?=
 =?utf-8?B?ZFkzNGJ2UE5CajRLY3pwQkxPN045TVJwWVlEUDR2anlKRjBJaHhXVXhCRFFi?=
 =?utf-8?B?RzFVNlNlcG40d09GYTA3MzRvbXBtb0pVZTZPLzlTR2NEWmRZKy9peXh0eG5Z?=
 =?utf-8?Q?pWA17Iwk5FyKkUI?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e46564-5489-4baa-bbac-08db377ad7ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 15:14:54.7028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3hNvCeTZx4vhgfl4z/gbPfZZNU0HGyLuF9dJbI3qXspuh3xQXaYRmttM45Isqjxmb8YScKw3lbLKNwIHiw80g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR02MB9768
X-Proofpoint-GUID: kW6Lq6mZZgBjGFvacg0RkObZZZfRT8fR
X-Proofpoint-ORIG-GUID: kW6Lq6mZZgBjGFvacg0RkObZZZfRT8fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_10,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304070140
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCcnlhbiBPJ0Rvbm9naHVlIDxi
cnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZz4gDQpTZW50OiBUdWVzZGF5LCBBcHJpbCA0LCAyMDIz
IDEyOjI2IEFNDQpUbzogQXphbSBTYWRpcSBQYXNoYSBLYXBhdHJhbGEgU3llZCA8YWthcGF0cmFA
cXVpY2luYy5jb20+OyBuaWNvbGFzLmRlY2hlc25lQGxpbmFyby5vcmcNClN1YmplY3Q6IEZ3ZDog
W1BBVENIIHY3IDAvNF0gbWVkaWE6IGNhbXNzOiBzbTgyNTA6IFZpcnR1YWwgY2hhbm5lbHMgc3Vw
cG9ydCBmb3IgU004MjUwDQoNCldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91
dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mIGFueSBsaW5rcyBvciBhdHRhY2ht
ZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KDQotLS0tLS0tLSBGb3J3YXJkZWQgTWVz
c2FnZSAtLS0tLS0tLQ0KU3ViamVjdDogUmU6IFtQQVRDSCB2NyAwLzRdIG1lZGlhOiBjYW1zczog
c204MjUwOiBWaXJ0dWFsIGNoYW5uZWxzIHN1cHBvcnQgZm9yIFNNODI1MA0KRGF0ZTogVHVlLCA0
IEFwciAyMDIzIDA4OjI1OjE3ICswMTAwDQpGcm9tOiBCcnlhbiBPJ0Rvbm9naHVlIDxicnlhbi5v
ZG9ub2dodWVAbGluYXJvLm9yZz4NClRvOiBNaWxlbiBNaXRrb3YgKENvbnN1bHRhbnQpIDxxdWlj
X21taXRrb3ZAcXVpY2luYy5jb20+LCBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20s
IGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubA0KDQpPbiAwNC8wNC8yMDIzIDAxOjA2LCBCcnlhbiBP
J0Rvbm9naHVlIHdyb3RlOg0KPiBPbiAwMy8wNC8yMDIzIDEzOjE2LCBNaWxlbiBNaXRrb3YgKENv
bnN1bHRhbnQpIHdyb3RlOg0KPj4NCj4+IE9uIDAzLzA0LzIwMjMgMTU6MTAsIEJyeWFuIE8nRG9u
b2dodWUgd3JvdGU6DQo+Pj4gT24gMDMvMDQvMjAyMyAxMjowMSwgTWlsZW4gTWl0a292IChDb25z
dWx0YW50KSB3cm90ZToNCj4+Pj4gSGkgQnJ5YW4sDQo+Pj4+DQo+Pj4+IG5vLCB0aGUgaXRlcmF0
aW9uIHRocm91Z2ggdGhlIG1hc2sgZGlkbid0IGdvIGF3YXk/IFRoZSBwcmludCBzaG93cyANCj4+
Pj4gdXAgd2hlbiB0aGUgY3NpZCBlbnRpdHkncyBzb3VyY2UgcGFkKHMpIGVuYWJsZXMgdGhlIGxp
bmsgdG8gdGhlIGlmZSANCj4+Pj4gc2luayBwYWQocykuIE1heWJlIHRoZSBjbGllbnQgKGxpYmNh
bWVyYT8pIGRlY2lkZXMgdG8gZGlzYWJsZSB0aGlzIA0KPj4+PiBsaW5rIGZvciBzb21lIHJlYXNv
bj8NCj4+Pj4NCj4+Pj4gUmVnYXJkcywNCj4+Pj4NCj4+Pj4gTWlsZW4NCj4+Pg0KPj4+IFNvIHBy
ZXZpb3VzbHkgd2UgaGFkIG9uZSBDU0kgZGV2aWNlIGluIHVzZXItc3BhY2UgYW5kIGFmdGVyIHlv
dXIgDQo+Pj4gY2hhbmdlIHdlIGhhdmUgb25lIENTSSBkZXZpY2UgcGVyIFZDLCBjb3JyZWN0ID8N
Cj4+Pg0KPj4+IC0tLQ0KPj4+IGJvZA0KPj4NCj4+IFdpdGggdGhlc2UgY2hhbmdlcyB0aGVyZSdz
IHN0aWxsIG9uZSBDU0lEIGRldmljZS9tZWRpYSBlbnRpdHksIGJ1dCBpdCANCj4+IGhhcyBtb3Jl
IHNvdXJjZSBwYWRzICg0IHZzIDEgcHJldmlvdXNseSkuDQo+Pg0KPj4gUmVnYXJkcywNCj4+DQo+
PiBNaWxlbg0KPj4NCj4NCj4gT0suDQo+DQo+IEkgdG9vayB0aGUgdGltZSB0byBhcHBseSB0aGlz
IHNlcmllcyB0byBteSBkZXZlbG9wbWVudCB0cmVlLg0KPg0KPiBCZWZvcmU6DQo+IC0gZW50aXR5
IDE5OiBtc21fY3NpZDAgKDIgcGFkcywgMTAgbGlua3MpDQo+ICAgICAgICAgICAgICAgdHlwZSBW
NEwyIHN1YmRldiBzdWJ0eXBlIFVua25vd24gZmxhZ3MgMA0KPiAgICAgICAgICAgICAgIGRldmlj
ZSBub2RlIG5hbWUgL2Rldi92NGwtc3ViZGV2Ng0KPiAgICAgICAgICBwYWQwOiBTaW5rDQo+ICAg
ICAgICAgICAgICAgICAgW2ZtdDpVWVZZOF8yWDgvMTkyMHgxMDgwIGZpZWxkOm5vbmUgY29sb3Jz
cGFjZTpzcmdiXQ0KPiAgICAgICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5MCI6MSBbXQ0KPiAg
ICAgICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5MSI6MSBbXQ0KPiAgICAgICAgICAgICAgICAg
IDwtICJtc21fY3NpcGh5MiI6MSBbXQ0KPiAgICAgICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5
MyI6MSBbXQ0KPiAgICAgICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5NCI6MSBbXQ0KPiAgICAg
ICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5NSI6MSBbXQ0KPiAgICAgICAgICBwYWQxOiBTb3Vy
Y2UNCj4gICAgICAgICAgICAgICAgICBbZm10OlVZVlk4XzJYOC8xOTIweDEwODAgZmllbGQ6bm9u
ZSBjb2xvcnNwYWNlOnNyZ2JdDQo+ICAgICAgICAgICAgICAgICAgLT4gIm1zbV92ZmUwX3JkaTAi
OjAgW10NCj4gICAgICAgICAgICAgICAgICAtPiAibXNtX3ZmZTFfcmRpMCI6MCBbXQ0KPiAgICAg
ICAgICAgICAgICAgIC0+ICJtc21fdmZlMl9yZGkwIjowIFtdDQo+ICAgICAgICAgICAgICAgICAg
LT4gIm1zbV92ZmUzX3JkaTAiOjAgW10NCj4NCj4gQWZ0ZXI6DQo+IC0gZW50aXR5IDE5OiBtc21f
Y3NpZDAgKDUgcGFkcywgMjIgbGlua3MpDQo+ICAgICAgICAgICAgICAgdHlwZSBWNEwyIHN1YmRl
diBzdWJ0eXBlIFVua25vd24gZmxhZ3MgMA0KPiAgICAgICAgICAgICAgIGRldmljZSBub2RlIG5h
bWUgL2Rldi92NGwtc3ViZGV2Ng0KPiAgICAgICAgICBwYWQwOiBTaW5rDQo+ICAgICAgICAgICAg
ICAgICAgW2ZtdDpVWVZZOF8yWDgvMTkyMHgxMDgwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdi
XQ0KPiAgICAgICAgICAgICAgICAgIDwtICJtc21fY3NpcGh5MCI6MSBbXQ0KPiAgICAgICAgICAg
ICAgICAgIDwtICJtc21fY3NpcGh5MSI6MSBbXQ0KPiAgICAgICAgICAgICAgICAgIDwtICJtc21f
Y3NpcGh5MiI6MSBbRU5BQkxFRF0NCj4gICAgICAgICAgICAgICAgICA8LSAibXNtX2NzaXBoeTMi
OjEgW10NCj4gICAgICAgICAgICAgICAgICA8LSAibXNtX2NzaXBoeTQiOjEgW10NCj4gICAgICAg
ICAgICAgICAgICA8LSAibXNtX2NzaXBoeTUiOjEgW10NCj4gICAgICAgICAgcGFkMTogU291cmNl
DQo+ICAgICAgICAgICAgICAgICAgW2ZtdDpVWVZZOF8yWDgvMTkyMHgxMDgwIGZpZWxkOm5vbmUg
Y29sb3JzcGFjZTpzcmdiXQ0KPiAgICAgICAgICAgICAgICAgIC0+ICJtc21fdmZlMF9yZGkwIjow
IFtFTkFCTEVEXQ0KPiAgICAgICAgICAgICAgICAgIC0+ICJtc21fdmZlMV9yZGkwIjowIFtdDQo+
ICAgICAgICAgICAgICAgICAgLT4gIm1zbV92ZmUyX3JkaTAiOjAgW10NCj4gICAgICAgICAgICAg
ICAgICAtPiAibXNtX3ZmZTNfcmRpMCI6MCBbXQ0KPiAgICAgICAgICBwYWQyOiBTb3VyY2UNCj4g
ICAgICAgICAgICAgICAgICBbZm10OlVZVlk4XzJYOC8xOTIweDEwODAgZmllbGQ6bm9uZSBjb2xv
cnNwYWNlOnNyZ2JdDQo+ICAgICAgICAgICAgICAgICAgLT4gIm1zbV92ZmUwX3JkaTEiOjAgW10N
Cj4gICAgICAgICAgICAgICAgICAtPiAibXNtX3ZmZTFfcmRpMSI6MCBbXQ0KPiAgICAgICAgICAg
ICAgICAgIC0+ICJtc21fdmZlMl9yZGkxIjowIFtdDQo+ICAgICAgICAgICAgICAgICAgLT4gIm1z
bV92ZmUzX3JkaTEiOjAgW10NCj4gICAgICAgICAgcGFkMzogU291cmNlDQo+ICAgICAgICAgICAg
ICAgICAgW2ZtdDpVWVZZOF8yWDgvMTkyMHgxMDgwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdi
XQ0KPiAgICAgICAgICAgICAgICAgIC0+ICJtc21fdmZlMF9yZGkyIjowIFtdDQo+ICAgICAgICAg
ICAgICAgICAgLT4gIm1zbV92ZmUxX3JkaTIiOjAgW10NCj4gICAgICAgICAgICAgICAgICAtPiAi
bXNtX3ZmZTJfcmRpMiI6MCBbXQ0KPiAgICAgICAgICAgICAgICAgIC0+ICJtc21fdmZlM19yZGky
IjowIFtdDQo+ICAgICAgICAgIHBhZDQ6IFNvdXJjZQ0KPiAgICAgICAgICAgICAgICAgIFtmbXQ6
VVlWWThfMlg4LzE5MjB4MTA4MCBmaWVsZDpub25lIGNvbG9yc3BhY2U6c3JnYl0NCj4gICAgICAg
ICAgICAgICAgICAtPiAibXNtX3ZmZTBfcGl4IjowIFtdDQo+ICAgICAgICAgICAgICAgICAgLT4g
Im1zbV92ZmUxX3BpeCI6MCBbXQ0KPiAgICAgICAgICAgICAgICAgIC0+ICJtc21fdmZlMl9waXgi
OjAgW10NCj4gICAgICAgICAgICAgICAgICAtPiAibXNtX3ZmZTNfcGl4IjowIFtdDQo+DQo+IFNv
IHRoYXQncyBjb25zaXN0ZW50IGFuZCB0aGlzIHdvcmtlZCBmb3IgbWUuDQo+DQo+IG1lZGlhLWN0
bCAtLXJlc2V0DQo+IG1lZGlhLWN0bCAtdiAtZCAvZGV2L21lZGlhMCAtViAnImlteDU3Nw0KPiAn
MjAtMDAxYSciOjBbZm10OlNSR0dCMTAvNDA1NngzMDQwIGZpZWxkOm5vbmVdJw0KPiBtZWRpYS1j
dGwgLVYgJyJtc21fY3NpcGh5MiI6MFtmbXQ6U1JHR0IxMC80MDU2eDMwNDBdJw0KPiBtZWRpYS1j
dGwgLVYgJyJtc21fY3NpZDAiOjBbZm10OlNSR0dCMTAvNDA1NngzMDQwXScNCj4gbWVkaWEtY3Rs
IC1WICcibXNtX3ZmZTBfcmRpMCI6MFtmbXQ6U1JHR0IxMC80MDU2eDMwNDBdJw0KPiBtZWRpYS1j
dGwgLWwgJyJtc21fY3NpcGh5MiI6MS0+Im1zbV9jc2lkMCI6MFsxXScNCj4gbWVkaWEtY3RsIC1s
ICcibXNtX2NzaWQwIjoxLT4ibXNtX3ZmZTBfcmRpMCI6MFsxXScNCj4gYnVpbGQveWF2dGEgLUIg
Y2FwdHVyZS1tcGxhbmUgLWMgLUkgLW4gNSAtZiBTUkdHQjEwUCAtcyA0MDU2eDMwNDAgLUYNCj4g
L2Rldi92aWRlbzANCj4NCj4gRm9yIHRoZSBzZXJpZXMuDQo+DQo+IEFja2VkLWJ5OiBCcnlhbiBP
J0Rvbm9naHVlIDxicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZz4NCg0KPiBIZXkgSGFucywgTGF1
cmVudC4NCg0KPiBEbyB5b3UgZ3V5cyBoYXZlIGFueSB0aG91Z2h0cyBvbiBwaWNraW5nIE1pbGVu
J3Mgc2VyaWVzIHVwID8NCg0KID4gRnJvbSBteSBwZXJzcGVjdGl2ZSBpdCB3b3JrcyB3ZWxsIGVu
b3VnaCBvbiB0aGUgU004MjUwIGhhcmR3YXJlLg0KDQo+IC0tLQ0KPiBib2QNCg0KSGkgVGVhbSAt
IEFwcHJlY2lhdGUgZm9yIGFueSBmZWVkYmFjayBvbiB3aGVuIHdlIGNhbiBnZXQgdGhpcyBzZXJp
ZXMgcGlja2VkIHVwLiBBcyB0aGlzIHdpbGwgaGVscCBjdXN0b21lcnMgdG8gZGlyZWN0bHkgcGlj
ayB0aGUgbGF0ZXN0IEtlcm5lbCBpbnN0ZWFkIG9mIGFwcGx5aW5nIHBhdGNoZXMgdG8gZWFjaCBr
ZXJuZWwgdmVyc2lvbi4NCg0KVGhhbmtzLA0KQXphbQ0K

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708F56D174E
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 08:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjCaGVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 02:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCaGVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 02:21:01 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A909272E;
        Thu, 30 Mar 2023 23:20:48 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V4K4uC018427;
        Fri, 31 Mar 2023 06:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=IYLAHZmpxuxs87+irhSnb7klnzSrvQIRVka5owScsu4=;
 b=H+jIYI5y+l7IPZNyD6Zj/frhhhwDOhiiRwFgCRFmdVfr5+4ZDrddZAafrN+DRALroYqk
 ntUjtq9n7gZKV7dcZmXbY2KnmLl2+ZbcvJiBtvKMolP/2xBkgslWcxyyqMONokVWW75M
 Di5vk7JR2wCB5ocM2uHtnHHsbtRDp2Pvl/Gw37tJen2d+BcWENOo2DzONvCzvQip9VH4
 oCPa7IKN0QZVp2XCJ68s7MiOvY9PM1ZEWIBnNaemMaf8oxBN/BFYoE3ilJGtjw7S7U/6
 vQNgqDejxNsA6Ur6wI6Aiv29deQTP57BMXYRAIEzhBXvU8iwE343KOjfihJRvCrgdfHy jw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pn7m3jsrf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Mar 2023 06:20:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgN+93cuBuNbBE6AHVQpmf5gy+EsNhobUMRy+rcb8ERabfvm/Kq5hYdT+7ykhnHSo98JihSUR4MudiZ8YKjDmFg0Br8dtd+ODOFBPK345IP0NrQojz7MtdCIV1PHUMqPahEPfZKz6Gg9Gi4sUl5X3CDSx37YLyOd8pKDr+aQme2G5FNUSZ520AarQONQl/lhy9jvQ+y6pdRAiPphBouzcBUFYHyldFZHagqhFbhdtbliP59xYbGW3XXZiZ5tkdMQcDyIulxTDZWnJfN4cEnHfrd525CQBrB/1PjWcNOxOUeV75p1WBZuHouawZpxL3BHfg6xgXtpYCK644bAZhHvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYLAHZmpxuxs87+irhSnb7klnzSrvQIRVka5owScsu4=;
 b=SSjHfC0Gom+9HPzXoAjyCkqoFikMrTQ3f0FiytPFgRx7oeKKKRwP3SC7UK6VcgwYugY2pKZB41a7y2gflBp1UKdZ5nfXTghrTrRJ2edf160pEILaGcaBJPoxA5UxPR62Wep15IuIsbsJsaKzTg+mHrtZfVNXIm77+PRNx5Y4FGEVlqfsMn+ePfU8PKuBvj3l9HqqY0WzfiBzjV6EJt1zKKVluRzuwemZuUt7lXnhE/sEWzJPYkL5CLytRyivOk2iBbNDQT9kS6yaQIu5M+6zUDLdj6iy5IXbGDNDEcEm8ziKsLTJkhzlZsfOl7L5LLKlji7RETTh4f/FjhpxS7aEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5575.namprd02.prod.outlook.com (2603:10b6:a03:a6::24)
 by DM6PR02MB6651.namprd02.prod.outlook.com (2603:10b6:5:21b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 06:20:22 +0000
Received: from BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::7f5:3f88:d232:fad7]) by BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::7f5:3f88:d232:fad7%6]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 06:20:21 +0000
From:   Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
To:     "Milen Mitkov (Consultant) (QUIC)" <quic_mmitkov@quicinc.com>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Thread-Topic: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support
 for SM8250
Thread-Index: AQHZC7JesKtl9LynUkWbNLJ6yX7UGa64jWqAgB+mC4CAAAJNgIABVD4AgDuP8LA=
Date:   Fri, 31 Mar 2023 06:20:21 +0000
Message-ID: <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
In-Reply-To: <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5575:EE_|DM6PR02MB6651:EE_
x-ms-office365-filtering-correlation-id: 6ff87ab9-2664-4697-7dcf-08db31b001a2
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+5xAcoXFjWpfEcJ49TPrmgBEIujWNy5j+g1EZ+Y+Ecp9yT7ZPEhcvETLzu94B03ZbJE1IpMq4ymPbV1bF3lvdhpyyocpPzynQHwcAu2EwG8CvgTJdfu59EKkJO6xSz5X3x1DvCBvoWSW8ko+gteB41OR7Vf4U/4Xi0MvMZkiPq9fr6/Gjw+OxRnpelG/Uqw7A2WObE08jsRyifzuzBZ9xQzXNfHho9ZWYa0Cmf9yrL+kIhwv0cVhpxCN8Tn1+CMMQhz0YuMlK7kUiOXwNl0u9CHWRdInzSb2In+1/SXL+E6r1gyIiErJuX6+WDpyck7od+MTV+WN+b3OsRA8KlLkJZBYeX6caOCFDMsikKldc36b3J0gulzrY5ObBd3yV5Z03TwM7EpIT2Hxx7jMZ5TY5OoIZa8EkGllUBgm3LzaQWzvCXv90kLU3LJG0zry8BlY2t/r3fKLQm47zRpXgv4sQGlxUd7i7YVDcYBb7RQtycLPeSn5GXByeuiviGEdZIGp0Cfc/RdaD//NXtPgN0Yuht/y/73PKSv9Atb9Bd3WDwxivvq/OVxZuvGqi6x/yo1R3qQZHL5cUPuO2LzkFyQ3AQiFvCFHE/VDgWLxYZOE11quo8Wh/lUEcahFoQQwmSN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5575.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(122000001)(8936002)(38100700002)(33656002)(5660300002)(66556008)(38070700005)(4326008)(86362001)(64756008)(52536014)(8676002)(55016003)(41300700001)(66446008)(66946007)(76116006)(66476007)(186003)(83380400001)(53546011)(54906003)(110136005)(6506007)(2906002)(9686003)(478600001)(71200400001)(7696005)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3pBT1FTYlR3NTFTR3M2V2ZsMTY0TGxxMGpJbXdleGQxdU04TUxBNUxpYjJ6?=
 =?utf-8?B?aE0vRjhsUmErYWNQMTIyYzZ2MUJ5UFdmMTFVY1h0dC9vNUZWU2NPVmxtWHJk?=
 =?utf-8?B?N1ByNXM3VUVCSVZFUUtqeHEybTI1R3ZKV2E1ekg1NUxvN2NrSnJiVEo2alpM?=
 =?utf-8?B?WUk1TytWYlY3RjNBbGkyMHV0bDhxZTBucWlFS0dkblFMUzVZbDREN2lpZ21M?=
 =?utf-8?B?TnY4di9iWDNLaVowWkRZbDhaSWQ1eVpjZUVsOXpZK3I0NkJtRkxncVdDUk5K?=
 =?utf-8?B?Qzg4OTNLblM4TUFsL2IzcGpEU3F3clVvVmxNbUZaN1pGc3JtanlXMkJuTkQw?=
 =?utf-8?B?WHpqekhFQnZMUGJTd01wUzR2Qmx2ZWpMdnFEcktlUWhCUW9XazNyZkNIMC9E?=
 =?utf-8?B?Q2RoQ0kwOXV2TTlpanZtVzcvamkrOVB5Z09ZSFVCMExrU2pVbGtNTWNuN09u?=
 =?utf-8?B?c3lQdFRQelNrdUJLeHd2WDFFZUlEMXEvUWgrTCtLSTZnamhjVWFUUnNQZE1h?=
 =?utf-8?B?NjVnaHhRNm84U2Vhc0ErMkdZNXBrMDMxdVRpVStQQy9DNFJCTVRnVDJJNXBU?=
 =?utf-8?B?bFMwZGJRUTNjQ0NTZ2Z6YStDYzVwbjRya2pMOS82WkRiOXBFYk9nZ0l6OWpD?=
 =?utf-8?B?S3hLSEdaTnQ2NVlPU1QwVUhmcmd5TlVoWjJzamwxQS9TRlk1VEs5SVNxQVA2?=
 =?utf-8?B?WWtXZ2x0UDE2T2daczZvSEo5NG0yRzNweHNPbkY0MmVkVUlvTXZZUlIyVDdP?=
 =?utf-8?B?K3hGcmZObEIxMjhsVXIyZEd5SXVkc2xXVGU5T0tCdjR1Z092YXA5bWZHVVlh?=
 =?utf-8?B?NU9SU3MyUmNocklCcjZjNEJnSVZuWVZRUS9lQzlsak45NThoVkxJRWhKSnhu?=
 =?utf-8?B?NmVwdytCVmpvRXBMUjJ6NXI0bk9LcWFMVmVsaU53cVloaUhCSDZDOFJmM3pM?=
 =?utf-8?B?NWp4eUV0SjRMdFVWbEhZYStZR1A3dTFZekUvSHJHK1VVeXdYVXVvZTdMV0tn?=
 =?utf-8?B?d0R4c3RxUWdZYTdiMW1ZNE15SGxRemJwY3lkZmFMbHd2Zk91dHljWm9XSWY2?=
 =?utf-8?B?aGRoVWpFNjZubC95emFaQkVOSk5kc0ZydDFYMy9FTzIzdUpGOGVRN1pCLzF3?=
 =?utf-8?B?NFF2OS9DZXV0a3h3ZjR6QW1HdEMra204YzN6TGl5YmZWL01JU2pYTDF5d1Bm?=
 =?utf-8?B?K3h6bTdVSTlKbTBaR2c5R2xiTURMdEFuTnJhVHBkd1drcWNOQTcxUVBHbU9D?=
 =?utf-8?B?WjVqMWxHK2RMTi9VOWxFM3NYRnh0U2tPV0xBbHBLeEU3Y1lLM1ZjMFB5LzVP?=
 =?utf-8?B?elBYUU5paWpYR0hWRytmUEJ3UzhTUTBZa1pLQXM5KzI4Tzh3ZkFCTHVhQXpp?=
 =?utf-8?B?Y2VYTTJ4eHlHK2FMaHB4ZERUb1hMM3VPRmNOVGRIZGNRa21UZ3BRY1AwUlk4?=
 =?utf-8?B?K1VqVUwrb3BxTEtTWk1qMmZobFpyNkVXbXRiUXE2UWEvRXE2UklpK21CNHlM?=
 =?utf-8?B?Lzg5WlFuU0dvS05BMEFFbjQxblRxTG9NdzhYWEZzWno5TWlSN1lYZDhhYmdz?=
 =?utf-8?B?bGtqdXhiR2tzQXEyZEdLYSt5U3ZuMEp6RFVFWjA1a21WSXFaUDZqSUtZM05Y?=
 =?utf-8?B?TVlwakV6UjJITDRjTzd4a1ZROThSL0NDbmlCektxUloweEtLcjE4OUJIUk45?=
 =?utf-8?B?SE9xak84TThoQkdGcGZXUjE1Y1kwdmFHbThYRVdNZHlha0l3cS9YcU8rQXBL?=
 =?utf-8?B?NkxtODR3SDNBWlAyRTZkY0FPWXJJRDFXSllXT2Yybkc3TTNhYVZIS1NBZGw0?=
 =?utf-8?B?VTVoOTZkSG1Xc1ErNERFK3IwK3lBejJoZ05UQmNlbWV4Ky95R1lxNHdkUzlJ?=
 =?utf-8?B?YXFiME5OQ3N2SHVNVHJBRlIxS0RETDZnVExUZ1dxNHJhdmlGemszTHd4ckpB?=
 =?utf-8?B?YVlBRGhmclJHNlR6QkRocVJzYkJVYmtUQ1Q1OWNnOVJNZkxCOUVUZXRNNFEr?=
 =?utf-8?B?MHZ1ZUVIR2RoMWd4WVY2WExZcHgwNm1RaWZMeG95bWVLZlUrNWZ2L0IxN3ZW?=
 =?utf-8?B?SmY1QmF0WWJaazZZY0JEN0JVN2xOVi9ZaWhLMTJHS2oraFVGai9jS0YydlE5?=
 =?utf-8?Q?8GPOJBaJDnjlGYVIndAELZ4th?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?RnVYbFNMNUFpbFRjNVdVU2Q3QUVYTElrUTZGWllFV1RCdnc1QzBFczJDcEFF?=
 =?utf-8?B?aDdGZStqY1FubVlncW1QckpMcFVSRk95MHpxM0k3bGdNOGpQV0ZBNU1laDBs?=
 =?utf-8?B?OFNSamJhdElteExlOW1wbG5uWUFVankxREdwZTdnL25tVEtXZjlMbGx1THRQ?=
 =?utf-8?B?Y3pnU0x0SUVuaWMyR2U0WFJldjQ3b3p1WHZPRTJaZXZaV0gzU1c4NEZ2U1pU?=
 =?utf-8?B?SnRjdllwKzFrMllJUW45RmUrMDZFb09KemFJR3dZNnlSTXBFMHdUdXB4THpz?=
 =?utf-8?B?dmUxckQzVFF1NS8rc2hwQWxTUCtsbWZVNnR2cjB3eGRMQlV1amRSV3dVSXBp?=
 =?utf-8?B?K2ZreDY1ZWNBSXhNdTd1U3NONjVXdmhVWHdxdUVvaUM0NlZBby9OZU0zbW1m?=
 =?utf-8?B?KzNSWGtlQWVTU3RtZ1FKcytIRkxZdTVjYmdNS2U1WGR5U3JxNW9aZHdiOW5p?=
 =?utf-8?B?bVQraDNsQ1VYdy9PRjdDNHR0dlVWU2hYRFFjMGxHRzNSZHJPSDFMUmtnVWVo?=
 =?utf-8?B?TDJiSnB3eUg2ZVNqL2ExY05BYTU1TkhhcTVvWjh2N3gyY2NaVmRxVnkyZUNk?=
 =?utf-8?B?bGJpQVh6dGFtcER3ckl4cUxtcFc2RjlzQ1VLNUR2bTY0Z0F3Sk45SnZQdFhW?=
 =?utf-8?B?YWlNU2x4ZmxpcU84QTdkRmYrUFlDb2RtTVBNQXBkMVhsU0o1SUduNkM4UHFI?=
 =?utf-8?B?MkNzTGxCNUJnT1F3WllyVG1zdXllZzRoa01KbDBZbHVma2lmQVFXWjUrZXB1?=
 =?utf-8?B?bTNUY3llWHYwdmlYY0JISktPV2JTT3lHWjRycTN1aW5OZmJSN3ROd0VCd3JO?=
 =?utf-8?B?eDhxdGs5ZnVVYW16NWNEZ1VSTXd3QVFwcGFIVkw3MG5rN055UjB6a3l6cnhH?=
 =?utf-8?B?Q2dCZERQMGVuWHpBVVVEQVBiN1VNR1F2dFFjUXZab1JGR05TSGlRWHBTd003?=
 =?utf-8?B?a202QkJaVHZMeVVGYnZZWkFET2lWWE94UGt1dk1IR2VUN3Bla1V5ZnlwQ0lp?=
 =?utf-8?B?WS9pZkk1YTl4WGNiemR3WWtCOXg5QjN1emk1Q2M3eWlqcXRLSmNsSnZJL2Rx?=
 =?utf-8?B?QXhaY0NYTVVZWU5IaDUyUFBKeVVvM2JMc0RlQldhUDNKc0ZlVmc4SCttdFZN?=
 =?utf-8?B?UUxwdkFNZEltS3hBUTYzcE5YblUyOEN3VW9LRExpMmJ5SFdWb2FCMDNKOFRW?=
 =?utf-8?B?dzc2djYwb0UySmdYMkFoLzBhN0tPNkdwZU1EVlBOaTNWOU1mcmFCQjlhb2FS?=
 =?utf-8?Q?LMUW8oOSgjHzeZZ?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff87ab9-2664-4697-7dcf-08db31b001a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 06:20:21.4310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUsUZq+40YKazmKtzwuIHMzia1zSvZkLri63pfrwQZ+0AsfpD3oukao+TRICZWJCio5Wbw7RRmH1ArYitGDBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6651
X-Proofpoint-ORIG-GUID: l2eUHNbhMXD5PYbPXzSimFy-DApOMWjr
X-Proofpoint-GUID: l2eUHNbhMXD5PYbPXzSimFy-DApOMWjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310051
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KyBOaWNvIChMaW5hcm8pDQpIaSBUZWFtDQoNCldvdWxkIGxpa2UgdG8ga25vdyBpZiBhbnl0aGlu
ZyBpcyBwZW5kaW5nIGZvcm0gb3VyIGVuZCBhcyB3ZSB3YW50IHRvIGdldCB0aGUgcGF0Y2hlcyBt
YWlubGluZWQ/DQoNClRoYW5rcywNCkF6YW0NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IE1pbGVuIE1pdGtvdiAoQ29uc3VsdGFudCkgKFFVSUMpIDxxdWljX21taXRrb3ZAcXVp
Y2luYy5jb20+IA0KU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjEsIDIwMjMgMTI6NDQgQU0NClRv
OiBicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgQXphbSBTYWRpcSBQYXNoYSBLYXBhdHJh
bGEgU3llZCA8YWthcGF0cmFAcXVpY2luYy5jb20+OyBKaWdhcmt1bWFyIFphbGEgPGp6YWxhQHF1
aWNpbmMuY29tPjsgdG9kb3IudG9vQGdtYWlsLmNvbQ0KQ2M6IGFncm9zc0BrZXJuZWwub3JnOyBr
b25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnOyBtY2hlaGFiQGtlcm5lbC5vcmc7IENoYW5kYW4g
R2VyYSA8Y2dlcmFAcXRpLnF1YWxjb21tLmNvbT47IEd1cnUgQ2hpbm5hYmhhbmRhciA8Z2NoaW5u
YWJAcXVpY2luYy5jb20+OyBBbGlyZXphIFlhc2FuIDxheWFzYW5AcXRpLnF1YWxjb21tLmNvbT47
IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSCB2
NyAwLzRdIG1lZGlhOiBjYW1zczogc204MjUwOiBWaXJ0dWFsIGNoYW5uZWxzIHN1cHBvcnQgZm9y
IFNNODI1MA0KDQoNCk9uIDIwLzAyLzIwMjMgMTQ6MjYsIEJyeWFuIE8nRG9ub2dodWUgd3JvdGU6
DQo+IE9uIDIwLzAyLzIwMjMgMTI6MTgsIE1pbGVuIE1pdGtvdiAoQ29uc3VsdGFudCkgd3JvdGU6
DQo+PiBPbiAzMS8wMS8yMDIzIDExOjAwLCBNaWxlbiBNaXRrb3YgKENvbnN1bHRhbnQpIHdyb3Rl
Og0KPj4+IE9uIDA5LzEyLzIwMjIgMTE6NDAsIHF1aWNfbW1pdGtvdkBxdWljaW5jLmNvbSB3cm90
ZToNCj4+Pj4gRnJvbTogTWlsZW4gTWl0a292IDxxdWljX21taXRrb3ZAcXVpY2luYy5jb20+DQo+
Pj4+DQo+Pj4+IEZvciB2NzoNCj4+Pj4gLSBGaXggYW4gaXNzdWUgd2l0aCBvdXRwdXQgc3RhdGUg
Zm9yIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUgSUZFDQo+Pj4+IMKgwqAgaGFyZHdhcmUgKGZv
ciBwbGF0Zm9ybXMgZGlmZmVyZW50IGZyb20gUVJCNSwgZS5nLiBRUkIzKS4NCj4+Pj4NCj4+Pj4g
Rm9yIHY2Og0KPj4+PiAtIEZpeCBmb3IgYSBwb3RlbnRpYWwgcmFjZSBjb25kaXRpb24gaW4gY3Np
ZA0KPj4+PiAtIE1vcmUgZGV0YWlsZWQgZGVzY3JpcHRpb24gb24gaG93IHRvIHVzZS90ZXN0IHRo
aXMgZmVhdHVyZSBpbg0KPj4+PiDCoMKgIHVzZXItc3BhY2UgaW4gdGhlIGxhc3QgcGF0Y2guDQo+
Pj4+DQo+Pj4+IEZvciB2NToNCj4+Pj4gLSBVc2UgZW50aXR5LT51c2VfY291bnQgaW5zdGVhZCBv
ZiBzX3N0cmVhbSBzdWJkZXYgY2FsbCByZXQgY29kZSB0bw0KPj4+PiDCoMKgIGNoZWNrIGlmIGFu
b3RoZXIgaW5zdGFuY2Ugb2YgdGhlIHBpcGVsaW5lIGlzIHJ1bm5pbmcuIFByZXZlbnRzIA0KPj4+
PiBhbg0KPj4+PiDCoMKgIGVycm9yIG9uIDYuMSBhbmQgdXAsIHdoZW4gc3RvcHBpbmcgb25lIG9m
IHNldmVyYWwgc2ltdWx0YW5lb3VzDQo+Pj4+IMKgwqAgaW5zdGFuY2VzLg0KPj4+PiAtIGZsdXNo
IGJ1ZmZlcnMgaW5zdGVhZCBvZiBqdXN0IHJldHVybmluZyBpZiB0aGUgcGlwZWxpbmUgZGlkbid0
IA0KPj4+PiBzdGFydC4NCj4+Pj4NCj4+Pj4gRm9yIHY0Og0KPj4+PiAtIGZpeGVzIHRoZSB3YXJu
aW5nIHJlcG9ydGVkIGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdA0KPj4+PiAtIHRpbnkgY29kZSBj
aGFuZ2UgdG8gZW5hYmxlIHRoZSB2YyBmdW5jdGlvbmFsaXR5IHdpdGggdGhlIA0KPj4+PiBwYXJ0
aWFsbHktYXBwbGllZA0KPj4+PiDCoMKgIG11bHRpc3RyZWFtIHBhdGNoZXMgb24gbGludXgtbmV4
dCAodGVzdGVkIG9uIHRhZzpuZXh0LTIwMjIxMDEwKQ0KPj4+Pg0KPj4+PiBGb3IgdjM6DQo+Pj4+
IC0gc2V0dGluZyB0aGUgc2luayBwYWQgZm9ybWF0IG9uIHRoZSBDU0lEIGVudGl0eSB3aWxsIG5v
dyBwcm9wYWdhdGUgDQo+Pj4+IHRoZQ0KPj4+PiDCoMKgIGZvcm1hdCB0byB0aGUgc291cmNlIHBh
ZHMgdG8ga2VlcCB0aGUgc3ViZGV2IGluIGEgdmFsaWQgaW50ZXJuYWwgDQo+Pj4+IHN0YXRlLg0K
Pj4+PiAtIGNvZGUgc3ludGF4IGltcHJvdmVtZW50cw0KPj4+Pg0KPj4+PiBGb3IgdjI6DQo+Pj4+
IC0gY29kZSBzeW50YXggaW1wcm92ZW1lbnRzDQo+Pj4+IC0gVGhlIGluZm8gcHJpbnQgZm9yIHRo
ZSBlbmFibGVkIFZDcyB3YXMgZGVtb3RlZCB0byBhIGRiZyBwcmludC4gDQo+Pj4+IENhbiBiZQ0K
Pj4+PiDCoMKgIGVuYWJsZWQgd2l0aCBkeW5hbWljIGRlYnVnLCBlLmcuOg0KPj4+PiBlY2hvICJm
aWxlIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy8qICtwIiA+IA0KPj4+PiAvc3lz
L2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wNCj4+Pj4NCj4+Pj4gTk9URTogVGhl
c2UgY2hhbmdlcyBkZXBlbmQgb24gdGhlIG11bHRpc3RyZWFtIHNlcmllcywgdGhhdCBhcyBvZiAN
Cj4+Pj4geWV0IGlzIHN0aWxsIG5vdCBtZXJnZWQgdXBzdHJlYW0uIEhvd2V2ZXIsIHBhcnQgb2Yg
dGhlIG11bHRpc3RyZWFtIA0KPj4+PiBwYXRjaGVzIGFyZSBtZXJnZWQgaW4gbGludXgtbmV4dCAo
dGVzdGVkIG9uIHRhZzpuZXh0LTIwMjIxMDEwKSwgDQo+Pj4+IGluY2x1ZGluZyB0aGUgcGF0Y2gg
dGhhdCBpbnRyb2R1Y2VzIHRoZQ0KPj4+PiB2aWRlb19kZXZpY2VfcGlwZWxpbmVfYWxsb2Nfc3Rh
cnQoKSBmdW5jdGlvbmFsaXR5LiBUaGlzIGFsbG93cyANCj4+Pj4gYXBwbHlpbmcgYW5kIHVzaW5n
IHRoaXMgc2VyaWVzIG9uIGxpbnV4LW5leHQgd2l0aG91dCBhcHBseWluZyB0aGUgDQo+Pj4+IGNv
bXBsZXRlIG11bHRpc3RyZWFtIHNldC4NCj4+Pj4NCj4+Pj4gVGhlIENTSUQgaGFyZHdhcmUgb24g
U004MjUwIGNhbiBkZW11eCB0aGUgaW5wdXQgZGF0YSBzdHJlYW0gaW50byANCj4+Pj4gbWF4aW11
bSBvZiA0IG11bHRpcGxlIHN0cmVhbXMgZGVwZW5kaW5nIG9uIHZpcnR1YWwgY2hhbm5lbCAodmMp
IG9yIA0KPj4+PiBkYXRhIHR5cGUgKGR0KSBjb25maWd1cmF0aW9uLg0KPj4+Pg0KPj4+PiBTaXR1
YXRpb25zIGluIHdoaWNoIGRlbXV4aW5nIGlzIHVzZWZ1bDoNCj4+Pj4gLSBIRFIgc2Vuc29ycyB0
aGF0IHByb2R1Y2UgYSAyLWZyYW1lIEhEUiBvdXRwdXQsIGUuZy4gYSBsaWdodCBhbmQgYSANCj4+
Pj4gZGFyayBmcmFtZQ0KPj4+PiDCoMKgICh0aGUgc2V0dXAgd2UgdXNlZCBmb3IgdGVzdGluZywg
d2l0aCB0aGUgaW14NDEyIHNlbnNvciksDQo+Pj4+IMKgwqAgb3IgYSAzLWZyYW1lIEhEUiBvdXRw
dXQgLSBsaWdodCwgbWVkaXVtLWxpdCwgZGFyayBmcmFtZS4NCj4+Pj4gLSBzZW5zb3JzIHdpdGgg
YWRkaXRpb25hbCBtZXRhZGF0YSB0aGF0IGlzIHN0cmVhbWVkIG92ZXIgYSANCj4+Pj4gZGlmZmVy
ZW50DQo+Pj4+IMKgwqAgdmlydHVhbCBjaGFubmVsL2RhdGF0eXBlLg0KPj4+PiAtIHNlbnNvcnMg
dGhhdCBwcm9kdWNlIGZyYW1lcyB3aXRoIG11bHRpcGxlIHJlc29sdXRpb25zIGluIHRoZSBzYW1l
IA0KPj4+PiBwaXhlbA0KPj4+PiDCoMKgIGRhdGEgc3RyZWFtDQo+Pj4+DQo+Pj4+IFdpdGggdGhl
c2UgY2hhbmdlcywgdGhlIENTSUQgZW50aXR5IGhhcywgYXMgaXQgZGlkIHByZXZpb3VzbHksIGEg
DQo+Pj4+IHNpbmdsZSBzaW5rIHBvcnQgKDApLCBhbmQgYWx3YXlzIGV4cG9zZXMgNCBzb3VyY2Ug
cG9ydHMgKDEsIDIsMywgDQo+Pj4+IDQpLiBUaGUgdmlydHVhbCBjaGFubmVsIGNvbmZpZ3VyYXRp
b24gaXMgZGV0ZXJtaW5lZCBieSB3aGljaCBvZiB0aGUgDQo+Pj4+IHNvdXJjZSBwb3J0cyBhcmUg
bGlua2VkIHRvIGFuIG91dHB1dCBWRkUgbGluZS4gRm9yIGV4YW1wbGUsIHRoZSANCj4+Pj4gbGlu
ayBiZWxvdyB3aWxsIGNvbmZpZ3VyZSB0aGUgQ1NJRCBkcml2ZXIgdG8gZW5hYmxlIHZjIDAgYW5k
IHZjIDE6DQo+Pj4+DQo+Pj4+IG1lZGlhLWN0bCAtbCAnIm1zbV9jc2lkMCI6MS0+Im1zbV92ZmUw
X3JkaTAiOjBbMV0nDQo+Pj4+IG1lZGlhLWN0bCAtbCAnIm1zbV9jc2lkMCI6Mi0+Im1zbV92ZmUw
X3JkaTEiOjBbMV0nDQo+Pj4+DQo+Pj4+IHdoaWNoIHdpbGwgYmUgZGVtdXhlZCBhbmQgcHJvcGFn
YXRlZCBpbnRvIC9kZXYvdmlkZW8wIGFuZCANCj4+Pj4gL2Rldi92aWRlbzEgcmVzcGVjdGl2ZWx5
LiBXaXRoIHRoaXMsIHRoZSB1c2Vyc3BhY2UgY2FuIHVzZSBhbnkgDQo+Pj4+IG5vcm1hbCBWNEwy
IGNsaWVudCBhcHAgdG8gc3RhcnQvc3RvcC9xdWV1ZS9kZXF1ZXVlIGZyb20gdGhlc2UgdmlkZW8g
DQo+Pj4+IG5vZGVzLiBUZXN0ZWQgd2l0aCB0aGUgeWF2dGEgYXBwLg0KPj4+Pg0KPj4+PiBUaGUg
Zm9ybWF0IG9mIGVhY2ggUkRJIGNoYW5uZWwgb2YgdGhlIHVzZWQgVkZFKHMpIChtc21fdmZlMF9y
ZGkwLA0KPj4+PiBtc21fdmZlMF9yZGkxLC4uLikgbXVzdCBhbHNvIGJlIGNvbmZpZ3VyZWQgZXhw
bGljaXRseS4NCj4+Pj4NCj4+Pj4gTm90ZSB0aGF0IGluIG9yZGVyIHRvIGtlZXAgYSB2YWxpZCBp
bnRlcm5hbCBzdWJkZXZpY2Ugc3RhdGUsIA0KPj4+PiBzZXR0aW5nIHRoZSBzaW5rIHBhZCBmb3Jt
YXQgb2YgdGhlIENTSUQgc3ViZGV2aWNlIHdpbGwgcHJvcGFnYXRlIA0KPj4+PiB0aGlzIGZvcm1h
dCB0byB0aGUgc291cmNlIHBhZHMuIEhvd2V2ZXIsIHNpbmNlIHRoZSBDU0lEIGhhcmR3YXJlIA0K
Pj4+PiBjYW4gZGVtdXggdGhlIGlucHV0IHN0cmVhbSBpbnRvIHNldmVyYWwgc3RyZWFtcyBlYWNo
IG9mIHdoaWNoIGNhbiANCj4+Pj4gYmUgYSBkaWZmZXJlbnQgZm9ybWF0LCBpbiB0aGF0IGNhc2Ug
ZWFjaCBzb3VyY2UgcGFkJ3MgZm9ybWF0IG11c3QgDQo+Pj4+IGJlIHNldCBpbmRpdmlkdWFsbHks
IGUuZy46DQo+Pj4+DQo+Pj4+IG1lZGlhLWN0bCAtViAnIm1zbV9jc2lkMCI6MVtmbXQ6U1JHR0Ix
MC8zODQweDIxNjBdJw0KPj4+PiBtZWRpYS1jdGwgLVYgJyJtc21fY3NpZDAiOjJbZm10OlNSR0dC
MTAvOTYweDU0MF0nDQo+Pj4+DQo+Pj4+IE1pbGVuIE1pdGtvdiAoNCk6DQo+Pj4+IMKgwqAgbWVk
aWE6IGNhbXNzOiBzbTgyNTA6IFZpcnR1YWwgY2hhbm5lbHMgZm9yIENTSUQNCj4+Pj4gwqDCoCBt
ZWRpYTogY2Ftc3M6IHZmZTogUmVzZXJ2ZSBWRkUgbGluZXMgb24gc3RyZWFtIHN0YXJ0IGFuZCBs
aW5rIHRvIA0KPj4+PiBDU0lEDQo+Pj4+IMKgwqAgbWVkaWE6IGNhbXNzOiB2ZmUtNDgwOiBNdWx0
aXBsZSBvdXRwdXRzIHN1cHBvcnQgZm9yIFNNODI1MA0KPj4+PiDCoMKgIG1lZGlhOiBjYW1zczog
c204MjUwOiBQaXBlbGluZSBzdGFydGluZyBhbmQgc3RvcHBpbmcgZm9yIA0KPj4+PiBtdWx0aXBs
ZQ0KPj4+PiDCoMKgwqDCoCB2aXJ0dWFsIGNoYW5uZWxzDQo+Pj4+DQo+Pj4+IMKgIC4uLi9wbGF0
Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWNzaWQtZ2VuMi5jwqDCoMKgwqAgfCA1NCANCj4+Pj4gKysr
KysrKysrKy0tLS0tLQ0KPj4+PiDCoCAuLi4vbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1z
cy1jc2lkLmPCoMKgwqAgfCA0NCArKysrKysrKystLS0tDQo+Pj4+IMKgIC4uLi9tZWRpYS9wbGF0
Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWNzaWQuaMKgwqDCoCB8IDExICsrKy0NCj4+Pj4gwqAgLi4u
L21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLTE3MC5jIHzCoCA0ICstDQo+Pj4+
IMKgIC4uLi9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS00ODAuYyB8IDYxDQo+
Pj4+ICsrKysrKysrKysrKy0tLS0tLS0NCj4+Pj4gwqAgLi4uL3BsYXRmb3JtL3Fjb20vY2Ftc3Mv
Y2Ftc3MtdmZlLWdlbjEuY8KgwqDCoMKgwqAgfMKgIDQgKy0NCj4+Pj4gwqAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS5jIHzCoCAxICsNCj4+Pj4gwqAgLi4uL21l
ZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmlkZW8uY8KgwqAgfCAyMSArKysrKystDQo+
Pj4+IMKgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy5jwqDCoMKgwqAg
fMKgIDIgKy0NCj4+Pj4gwqAgOSBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgNjQg
ZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBIaSBndXlzLA0KPj4+DQo+Pj4ganVzdCBhIHBpbmcgZm9y
IHRoaXMgc2VyaWVzLg0KPj4+DQo+Pj4gTGF1cmVudCwgSSBzZW50IHlvdSBhbiBlbWFpbCB3aXRo
IGFuc3dlcnMgdG8gdGhlIHF1ZXN0aW9ucyB5b3UgDQo+Pj4gcmVxdWVzdGVkLiBJIHJlYWQgeW91
ciByZXBseSB0aGF0IHlvdSdsbCByZXZpZXcgdGhlc2UgY2hhbmdlcyBpbiB0aGUgDQo+Pj4gY29u
dGV4dCBvZiB0aGUgbXVsdGktc3RyZWFtIEFQSSwgYnV0IHRoaXMgc2VyaWVzIGRvZXNuJ3QgcmVh
bGx5IHVzZSANCj4+PiB0aGUgbXVsdGktc3RyZWFtIEFQSSwganVzdCBhIG5vdGUuDQo+Pj4NCj4+
PiBDaGVlcnMsDQo+Pj4NCj4+PiBNaWxlbg0KPj4+DQo+PiBIaSB0aGVyZSwNCj4+DQo+PiBKdXN0
IGFub3RoZXIgcGluZy4uOikNCj4+DQo+PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUncyBh
bnl0aGluZyBJIGNvdWxkIGRvIChpbXByb3ZlL2ZpeC9jb2RlDQo+PiBkaWZmZXJlbnRseS9ldGMu
KSB0byBoZWxwIGdldCB0aGlzIHNlcmllcyBtZXJnZWQuDQo+Pg0KPj4NCj4+IEJlc3QgUmVnYXJk
cywNCj4+DQo+PiBNaWxlbg0KPj4NCj4+DQo+Pg0KPg0KPiBXZWxsLCB3ZSBuZWVkIHRvIHJlLXZl
cmlmeSBpdCB3b3JrcyBvbiBsaW51eC1uZXh0Lg0KPg0KPiBPdGhlciB0aGFuIHRoYXQgaXQgc2Vl
bXMgT0sgdG8gbWUuDQo+DQo+IC0tLQ0KPiBib2QNCg0KVGhhbmtzIEJyeWFuLA0KDQpJIGp1c3Qg
cmUtdGVzdGVkIG9uIGxhdGVzdCBsaW51eC1uZXh0IChuZXh0LTIwMjMwMjIxIHRhZykgYW5kIHRo
ZSBzZXQgYXBwbGllcyBhbmQsIGp1ZGdpbmcgYnkgdGhlIHN0YW5kYXJkIHNldCBvZiB0ZXN0cyBJ
IGRpZCwgd29ya3MgYXMgZXhwZWN0ZWQgYW5kIGRvZXNuJ3QgYnJlYWsgYW55dGhpbmcuDQoNCg0K
QmVzdCBSZWdhcmRzLA0KDQpNaWxlbg0KDQoNCg==

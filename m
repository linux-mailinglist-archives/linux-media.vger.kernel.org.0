Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9E94BA2EF
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 15:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241161AbiBQO0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 09:26:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiBQO0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 09:26:00 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516972B1670
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645107943; x=1676643943;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b9tPG0cvtZCO6HS5pSdPlY6vo3wO9hS7b0d31uGcsHA=;
  b=xNhOiwrhAo9Iz1uxcA3iXCs+ChN3YLOWxnlXaYifzyzVQkAlCeGcowvE
   ZC8jj58ZUznB2qWoqpTs1VirFZ6PkdgUEkig/g6yStEL0RSNQA+Bv2EQE
   JtcaPAa2yJehwwjANlBMNPVoRY2RNcotyHS7rposkcAqyBt2jQCjzhGxV
   8RP3gujZDKWfIogLkPJ6LLB4AqKEtXfGYjrvT2q9vRYFvrBBxXeaJgKx9
   pdNjKTogWLpie7zl+rbUhV9HAVipm905fkzNaVLWn/kJV1kWGtm6w8cWt
   gftvI9trVobIiQT7Jpwe8XidzfwDc79OdKHJc0LfenjnHi6KHwRiWZWve
   g==;
IronPort-SDR: CggcCbTUi9w+TPRAskqp5b+gz8wirNc2yB8zy1EUDdOZfJ5rYwhpFZw4CyXDBLueQ/omxM0EIw
 HAfxdplUnTh/cEuTB5MYrOluGEMIucsXxkaAb0qD9poMx8mynl3bvHbzyG1rIW5jVIpKIB6EI9
 uoEUeCTaQ+0pYN4XqoxwSGoCwD440uCfghrtFuNYcfqSFCIN9ZRyoLMXB+7lVkjELuRzI6U6XT
 My8UHSsojb/50QQ5Ff/JhpM9aErcNRaEgl0j6cj61LMoNaST+oWSphbCjxEERtX4ELO+F4HWNQ
 Fg4GUXVN0IT476Akov9sNhLD
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="146338320"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Feb 2022 07:25:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 17 Feb 2022 07:25:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 17 Feb 2022 07:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRY+DX8Lk7A70E5RbcaanYAp6iDcX1Sj0Fwl+z3yuj8qnQmYJUQIr9rkzj+aoskwswcWgzJIE4Fs3fJWXs7CHqD4BEWeOJrDCQfVVSR+GmfT5727t3rLz5KqdAi+PEYSBOo2vuLQ0A2jSQehNZKOzcgR2dUNYsf6yiK8zeC7chA9a6IEsmN7Aeuc+RPXOtKa9gxCa5Z3APAeknmVL0J6xou/8lY0Cn4hTG8PNLb1ky0bmHmB06dPfh51z3WcuYnsLnfaRoRaBUpuNOJRQqKCLGodnrTImmmHLIea3NY5PPCxHfvJcqZLz9GXIbyDwyWgBjfQ0ADudbuOyDJ7lXy+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9tPG0cvtZCO6HS5pSdPlY6vo3wO9hS7b0d31uGcsHA=;
 b=AUbi47AyOxU3rXptMpmDSDd6mWwf+T8o/S8ynNv0FJMworc0e8XHpPJZEwr1IXB38xX3Au/s6tfl4X3CZlpkL4cT1Qpk7RyhzJURVCBz5AYgZ1xfi0wip5BnnXvtDvS9nKRp8GM6VU/04wFuHI38WksO8kopisAkOoe+HXPy1krW4K+ogI93uJBsp5Rn303P1HyVpkly4u1SJg6yep0Yh/5cNBJ9YLrnVRZVQmtg//k/tXf7k7vJ1uejM8cqt812nFWFeUwKUo1Q0SxZBUYPJn/SUdmBIL944yz+defc8RHS8F4jGdQxPhpvk6ZFP4Qh4Ne4sDM/t658K3k35fGjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9tPG0cvtZCO6HS5pSdPlY6vo3wO9hS7b0d31uGcsHA=;
 b=HBSSq7067imoTb0dduUbPBtqO0/UiWJgOGLXtSHJfmsIU0O9Oi5Eh5u62/2c04svqnq3gFEPH1PJxiO/rY50K0qQN+EFUqxNjcCT8OAkQRKdU29pk/rasPYfVVobZI4iIn2l8sU67d2gHZVdiWMcWgqX2PHlwLrlZW60kcCJFUQ=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BN6PR11MB1331.namprd11.prod.outlook.com (2603:10b6:404:49::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 14:25:37 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4995.015; Thu, 17 Feb 2022
 14:25:37 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <slongerbeam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <hverkuil-cisco@xs4all.nl>,
        <mirela.rabulea@nxp.com>, <xavier.roumegue@oss.nxp.com>,
        <tomi.valkeinen@ideasonboard.com>, <hugues.fruchet@st.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <aford173@gmail.com>,
        <festevam@gmail.com>, <jbrunet@baylibre.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Thread-Topic: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Thread-Index: AQHYHm3wW57rjknMlU+S0OxseioqJKyOIe6AgAAVOACABOP8gIAACQIAgAAIkACAAD+rgIAEazoA
Date:   Thu, 17 Feb 2022 14:25:37 +0000
Message-ID: <6d2f7f6d-e610-fb35-0f4f-224dbaae262d@microchip.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <a5a75d0b-7f40-39d0-a8ec-4e143c5f3b1c@microchip.com>
 <20220211112500.7p3fi2xhwutap6ak@uno.localdomain>
 <23ac37a4-a979-2dbf-32ae-012d4ff45806@microchip.com>
 <20220214143816.wbtpd2klb6wvzt3c@uno.localdomain>
 <8c39e96c-1c1f-a279-a67c-1d113153ec13@microchip.com>
 <20220214185647.tbqv4lbuf3ba4yw7@uno.localdomain>
In-Reply-To: <20220214185647.tbqv4lbuf3ba4yw7@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82f6aab4-d75b-4127-9ccc-08d9f2215e1d
x-ms-traffictypediagnostic: BN6PR11MB1331:EE_
x-microsoft-antispam-prvs: <BN6PR11MB13311264DA0429253881D5F0E8369@BN6PR11MB1331.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfhXF2BZ14V/UPLaVuyKWdWMmfZ3KZO+kb3XQf2oENSzvJE4vI32Js0lL5kJxkEaoD2X2gGqsWQJOKld49mE9Qb4AXcyMD25V1KPjJLijgCq8VOQFng1QbHxoKrvCxYwnTSAos4H4b3BKruLRRh3cXCfkHh0ONzDcY3rccpc9B20WiwVPX01S5MQyAPpjOjA6U/82L+ztZ8R1s2V5mMqBXLNnq9ugeTBJSYArFtp+1XUPjIlJFf7RsdU50TdmVpgEOGuHw+KegFftAU02SK73rmuZO77zLkZPOAT8o4JdHuHjSKjU39nXh7gSHZmAkNUihY4lghWR+/+m3vsI2of8wRwssqVVqRr+KGJmSFWxl78YKdehIfcHsN0ujs3GrURdczAzVLMxEUzSBPXoyyrPaiN4P3fY2qBr8UCu2JjRFKTZl+W5Mhi/p8Ub/LCnQaYraWUyOynMID94BfWSCkBXzV3o1jmxpSi6yqLaFvOvu8nW2ONnkeNu9IpRbQ7Wqkhx3KBAlOCxZgmZe1qpXEXZXQyHYpemxv8zh3haS5vAZUSFBLxLR8IwnWIGKSZkjp3/fCzn0tMMcP3rHa2qJX4ZQGE7KmbdGM2KIc6ABaY0jOuT9JQdCSVcHR2jihbWsYjK/pF3EFgQdtqpBJWQipOmjPcZVjFWITd3b7y9x5O27xgQbG4QlF2sbjcbIVPWv4/Tk2lSXJstx1A+GbztSGPNSX4IGTzPEXab5Fp0+sWlOwXEBHKZN0huP7ovac6jTNLESTLEh3yZUDrtgmnJj/3tb56LMkVEFeEemPQNwfdUDWKdNAn57d3wriY3Qk+XPAHGfu+uafULhKt368uHPMqqxAfCqV4oMfs0R6/rdxw+f4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66476007)(66446008)(66946007)(316002)(2616005)(66556008)(76116006)(71200400001)(6486002)(6916009)(54906003)(91956017)(508600001)(31686004)(4326008)(36756003)(64756008)(966005)(8936002)(5660300002)(6506007)(53546011)(122000001)(26005)(7416002)(31696002)(83380400001)(86362001)(38070700005)(186003)(2906002)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzlLQjkvNjYvWlZNWEN1K1lhWVlEVGNXQTRZWFNxbVJUdGREeEI5TTdIcGNw?=
 =?utf-8?B?L3pNeVE4NWZ3S1k3bnN5c01DNEhjT1lhaEt0S3B6YnlqckQ3WStOWXVsSVVa?=
 =?utf-8?B?cm83b2Y2Sk9sSnBIcVZJWUVNdDFuKzRmcm0xdFFWRVIwWlRjSmo3dllpalNV?=
 =?utf-8?B?OEN1YWV3MFhMeGRvMHpEN0tTa2U3a1NzZFUzR0xBNnNJb3dJclNWTDd3OXY5?=
 =?utf-8?B?QzNqdDJFYk8yOEdldzNpS2dTdGNXTlpCRDJJSWRuNTRDWTdBVlI2OURxaXIx?=
 =?utf-8?B?TkdpSmlEcHg4OTQ5YmtmNUVBMXBXS0dPS3MxWDhSWk11MFVHWi83NlVsM2hp?=
 =?utf-8?B?MXFXOHRtT2xRb1YrWDE5UDlyUDNDSmpJZDFrcW03K2NwbU9Yb1VsdGVjbERo?=
 =?utf-8?B?SzN3cDh5Q3ppbkVjK0hHd05jVVJmRkpKdXk4aE9uWWFBRTlncHRiUDNnWjVM?=
 =?utf-8?B?Vy8wSkoyWm9TUkFDT2NYMXhhbU05enh1M0Fya2hKSFNrNk82cU5xcUNRN3Zv?=
 =?utf-8?B?NG14dlNDTm0yT240ejA3Yk9kNVRZS2JSd0tUdDJvQyswQnc5eElUUUpjT1hS?=
 =?utf-8?B?bVY0ZjJ6ODhnL3J1SCtibStjK3dSaVRzbU1rcDhlNGFCZFJvWldXUWxXRTBG?=
 =?utf-8?B?YlB3cEtMSjhwNmFERER2WFJ6ZDlja3BURDJDakJhd2VDQy91N0xuVTZMckts?=
 =?utf-8?B?NmM4K3FGQXRsZERFQ1ZvOHF0WGl0Tytua0FLa2ZSWkFldzViMVc4SS84QkRm?=
 =?utf-8?B?ZkZpaW80OFlpTzVpL1o0bm9odzRrODNIcSt6aEsrNWZBbVlLdEk0TDhuODgr?=
 =?utf-8?B?eForL0V1Wng3amVQTU9pcThFNU5aeGhoT3diS0o3NVVveVVBUXl1TWhiaENn?=
 =?utf-8?B?eUdJTzJXenhvKzVaY2hwajFtME51UU1TN3NQQldaT3RhQmN4b0JXUDVIRXZv?=
 =?utf-8?B?QkNoS09WSlIzTmJSYzZiYUt6TjZxeXJsUzMwSGNrV213cks5MWNaS2JoMFRm?=
 =?utf-8?B?RXJlNmllelpSS1RheTFvd1JFS2lKcFVrK2Y2QmRnUUcxOU1oU2g5N1hxbVBI?=
 =?utf-8?B?NTdmaVdKYjFRQUxyS2RRSWpXWWlZeVZWYU9TVThoWWtxY2tOVEJRZkRmb2U0?=
 =?utf-8?B?SlRzamNGUmR4K2E4QXJ1U3lSSTZicmFWSFRGSGs1TThOU0d2SzBWN3RJMmNO?=
 =?utf-8?B?dHRUZ2tLRVVlb0wwRG9VSW9xdHFMYnpaTGJuUmwxWHg5b1ZXeE4zN3I0M3ov?=
 =?utf-8?B?ZjY1cXo0KzVkekRHV0JkUW10LzBTYTRjMFc5QjdUaGVmcFhDdzY5Y1lQNFF0?=
 =?utf-8?B?OER6czVONWdqcTJ4dmFVZll1QzhWZ1BjUWFtSlkzb0pLL3hkOXlKZkRTOEU0?=
 =?utf-8?B?V1FLbS9ISzJqb1V6UGo5ODlIZkRXQldnRVJxOEhpWE1OaE1peUJkcXFybzR2?=
 =?utf-8?B?aW1ZNHlUMFphUmprM2pNU2JPdUVNRzBPYmNjSzNSeGpNa2ZCRm56V3ZxazFs?=
 =?utf-8?B?UFM3K3ZKNXczb1EwdERPM1pTQUQ1S1FSQzVnclE4RHBkdjQrdFZzSnZ2aXg2?=
 =?utf-8?B?WjRMME80c2RCOXloR25kcXBPMER5dUs0Zm5TMUpkMTdDcGF0ZnFwNEtQT3do?=
 =?utf-8?B?RHZIdGJkOXVrTW9yQzlPd2FFV3E0RzlDS1g2ZmF5VmxUSGF5bHdTSXdjalVV?=
 =?utf-8?B?WU1RL3ZLNFRtVEpkZEVlZHVMWHZaQ2xFUWZrRFRUb3cxTS9NNTRzSXZlbGph?=
 =?utf-8?B?TnI2aVVOQnhpVmVRczBTRTV6YndpUjFtWm5peFRIRk9GYkhpUWNUTUVWSDJZ?=
 =?utf-8?B?TEU1dkNyVGp2RVZNeEFqcUc3TkRUSzFNQnlBUUg2VldJQzJhdVdkVzZZVjg5?=
 =?utf-8?B?V1hIYjlLQVdOOHpuaFhLaFB4T1VVR2FTSWxrZTFKYmNsUUhnbHRzbWZhVFBF?=
 =?utf-8?B?REJvbEJnTW9ISk1hL0RkYk9OWUM3S0svVlM4STZ2cWxCbDZDZG9xV0N0cUo3?=
 =?utf-8?B?d1pDOTRXU2xQRmFBVVlNbUF5bzNSelp0WnY1Sklna3RhYTAxZXpMVFMyMDlu?=
 =?utf-8?B?d3BNNHphYjRDZDhsV0l2VEQzRU9hc2pZYmt3c2dKaHRNN1F2RXM0bkxEby81?=
 =?utf-8?B?dy93aHIwbVlpalltTEdHc2N5UnRid3VYZTNIeXJPeFVkb05menMwcGdCTE1C?=
 =?utf-8?B?dmJZUVF3UmdDL09NcmU0azN1TldiYVdOYytvNWZLS2w2aHNFWkRRM2ZmVGo4?=
 =?utf-8?B?WnlibEp1NjZsRVd1Y3Z6MnYzVXhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8ED3BA1ECDC01540B0544FDFC9A98187@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f6aab4-d75b-4127-9ccc-08d9f2215e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 14:25:37.5696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZtbHf+5EeZtjJXEJe7I6zL96oqZ4WL/rtTaOWdCSPmWfVMnIsPcVKAcS3nWWLbObteabpkjmTx8iTLkDI+hCVIWDfrTwX3X8FiJoqj2kPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1331
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi8xNC8yMiA4OjU2IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgRXVnZW4NCj4gDQo+IE9uIE1vbiwgRmViIDE0
LCAyMDIyIGF0IDAzOjA4OjU2UE0gKzAwMDAsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3
cm90ZToNCj4+IE9uIDIvMTQvMjIgNDozOCBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPj4+IEhp
IEV1Z2VuLA0KPj4+DQo+Pj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDI6MDY6MDJQTSArMDAw
MCwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+PiBPbiAyLzExLzIyIDE6
MjUgUE0sIEphY29wbyBNb25kaSB3cm90ZToNCj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPj4+Pj4NCj4+Pj4+IEhpIEV1Z2VuDQo+Pj4+Pg0KPj4+Pj4gICAgICAgICAg
ICB0aGFua3MgdmVyeSBtdWNoIGZvciB0ZXN0aW5nDQo+Pj4+Pg0KPj4+Pj4gT24gRnJpLCBGZWIg
MTEsIDIwMjIgYXQgMTA6MDk6MDRBTSArMDAwMCwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29t
IHdyb3RlOg0KPj4+Pj4+IE9uIDIvMTAvMjIgMTowNCBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0K
Pj4+Pj4+DQo+Pj4+Pj4gSGVsbG8gSmFjb3BvLA0KPj4+Pj4+DQo+Pj4+Pj4+IHYxOg0KPj4+Pj4+
PiBodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2xpc3Qv
P3Nlcmllcz03MjQ5DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEEgYnJhbmNoIGZvciB0ZXN0aW5nIGJhc2Vk
IG9uIHRoZSBtb3N0IHJlY2VudCBtZWRpYS1tYXN0ZXIgaXMgYXZhaWxhYmxlIGF0DQo+Pj4+Pj4+
IGh0dHBzOi8vZ2l0LnNyLmh0L35qbW9uZGlfL2xpbnV4ICNqbW9uZGkvbWVkaWEtbWFzdGVyL292
NTY0MC12Mg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJZiBhbnlvbmUgd2l0aCBhIERWUCBzZXR1cCBjb3Vs
ZCB2ZXJpZnkgSSBoYXZlIG5vdCBicm9rZW4gdGhlaXIgdXNlIGNhc2UNCj4+Pj4+Pj4gSSB3b3Vs
ZCB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZSB0aGF0IDopDQo+Pj4+Pj4NCj4+Pj4+PiBJIHN0YXJ0ZWQg
dGVzdGluZyB0aGlzIG9uIG15IGJlbmNoLg0KPj4+Pj4+IFNvIGZhciB0aGluZ3MgbG9vayBnb29k
Lg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gXG8vDQo+Pj4+Pg0KPj4+Pj4+IFRvIGJlIGFibGUgdG8g
dGVzdCB0aGlzLCBJIGhhdmUgdG8gcmV2ZXJ0IHRoaXMgcGF0Y2ggOg0KPj4+Pj4+ICJtZWRpYTog
aTJjOiBvdjU2NDA6IFJlbWFpbiBpbiBwb3dlciBkb3duIGZvciBEVlAgbW9kZSB1bmxlc3Mgc3Ry
ZWFtaW5nIg0KPj4+Pj4+DQo+Pj4+Pj4gT3RoZXJ3aXNlIHRoZSBzZW5zb3Igd2lsbCBub3QgcG93
ZXIgdXAgd2hlbiBzdGFydGluZyBzdHJlYW1pbmcuDQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEkg
aGF2ZSB0ZXN0ZWQgc2V2ZXJhbCBmb3JtYXRzLCBhcyB5b3Ugd29ya2VkIG1vcmUgb24gdGhpcyBz
ZW5zb3IsIGNvdWxkDQo+Pj4+Pj4geW91IHRlbGwgbWUsIGRvZXMgZm9ybWF0IFlVWVZfMng4IHdv
cmsgaW4gcGFyYWxsZWwgbW9kZSBhdCAxOTIweDEwODAgb3INCj4+Pj4+PiAxMDI0eDc2OCA/DQo+
Pj4+Pg0KPj4+Pj4gSSBuZXZlciB0ZXN0ZWQgdGhlIHNlbnNvciBkcml2ZXIgd2l0aCBhIHBhcmFs
bGVsIHNldHVwIEknbSBhZnJhaWQuDQo+Pj4+PiBUaGUgaWRlYSBiZWhpbmQgdGhpcyBzZXJpZXMg
aXMgdGhhdCBEVlAgc2hvdWxkbid0IGJlIGFmZmVjdGVkIGFuZA0KPj4+Pj4gY29udGludWUgd29y
a2luZyBsaWtlIGl0IGRpZC4NCj4+Pj4NCj4+Pj4gSGkgSmFjb3BvLA0KPj4+Pg0KPj4+PiBJIHdh
cyBob3BpbmcgdGhhdCB5b3UgaGFkIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGRyaXZlciB0
aGFuIG15c2VsZi4NCj4+Pg0KPj4+IE5vdCBvbiBEVlAgbW9kZSBJJ20gc29ycnkgOigNCj4+Pg0K
Pj4+PiBJIGNhbiB0ZWxsIHRoYXQgdGhlIHBhcmFsbGVsIG1vZGUgaXMgbm90IGFmZmVjdGVkIGJ5
IHlvdXIgc2VyaWVzIGZyb20NCj4+Pj4gd2hhdCBJJ3ZlIHNlZW4gc28gZmFyLg0KPj4+DQo+Pj4g
VGhhdCdzIGdyZWF0LCB0aGFua3MgZm9yIHRlc3RpbmcuDQo+Pg0KPj4NCj4+IEkgZm91bmQgb25l
IGNoYW5nZSwgYmVmb3JlIHlvdXIgc2VyaWVzLCBJIGNvdWxkIGF0dGVtcHQgdG8gY2FwdHVyZSBC
R0dSDQo+PiBAIDY0MHg0ODAsIG5vdyBpdCBsb29rcyB0byBiZSBnb25lIDoNCj4+DQo+PiBCZWZv
cmU6DQo+Pg0KPj4gIyB2NGwyLWN0bCAtZCAvZGV2L3Y0bC1zdWJkZXYxIC0tbGlzdC1zdWJkZXYt
ZnJhbWVzaXplcyBwYWQ9MCxjb2RlPTB4MzAwMQ0KPj4gaW9jdGw6IFZJRElPQ19TVUJERVZfRU5V
TV9GUkFNRV9TSVpFIChwYWQ9MCkNCj4+ICAgICAgICAgICBTaXplIFJhbmdlOiAxNjB4MTIwIC0g
MTYweDEyMA0KPj4gICAgICAgICAgIFNpemUgUmFuZ2U6IDE3NngxNDQgLSAxNzZ4MTQ0DQo+PiAg
ICAgICAgICAgU2l6ZSBSYW5nZTogMzIweDI0MCAtIDMyMHgyNDANCj4+ICAgICAgICAgICBTaXpl
IFJhbmdlOiA2NDB4NDgwIC0gNjQweDQ4MA0KPj4gICAgICAgICAgIFNpemUgUmFuZ2U6IDcyMHg0
ODAgLSA3MjB4NDgwDQo+PiAgICAgICAgICAgU2l6ZSBSYW5nZTogNzIweDU3NiAtIDcyMHg1NzYN
Cj4+ICAgICAgICAgICBTaXplIFJhbmdlOiAxMDI0eDc2OCAtIDEwMjR4NzY4DQo+PiAgICAgICAg
ICAgU2l6ZSBSYW5nZTogMTI4MHg3MjAgLSAxMjgweDcyMA0KPj4gICAgICAgICAgIFNpemUgUmFu
Z2U6IDE5MjB4MTA4MCAtIDE5MjB4MTA4MA0KPj4gICAgICAgICAgIFNpemUgUmFuZ2U6IDI1OTJ4
MTk0NCAtIDI1OTJ4MTk0NA0KPj4NCj4+DQo+PiBBZnRlcjoNCj4+DQo+PiAjIHY0bDItY3RsIC1k
IC9kZXYvdjRsLXN1YmRldjEgLS1saXN0LXN1YmRldi1mcmFtZXNpemVzIHBhZD0wLGNvZGU9MHgz
MDAxDQo+PiBpb2N0bDogVklESU9DX1NVQkRFVl9FTlVNX0ZSQU1FX1NJWkUgKHBhZD0wKQ0KPj4g
ICAgICAgICAgIFNpemUgUmFuZ2U6IDEyODB4NzIwIC0gMTI4MHg3MjANCj4+ICAgICAgICAgICBT
aXplIFJhbmdlOiAxOTIweDEwODAgLSAxOTIweDEwODANCj4+ICAgICAgICAgICBTaXplIFJhbmdl
OiAyNTkyeDE5NDQgLSAyNTkyeDE5NDQNCj4+DQo+IA0KPiBSaWdodC4uLiBJJ20gbGltaXRpbmcg
U1JHR0IgZm9ybWF0cyB0byBvbmx5IHJlc29sdXRpb25zID4gMTI4MHg3MjANCj4gYXMuLg0KPiAN
Cj4+DQo+PiBIb3dldmVyIHRyeWluZyBpdCB3aXRob3V0IHlvdXIgcGF0Y2hlcywgaXQgZG9lc24n
dCB3b3JrICwgSSBkb24ndA0KPiANCj4gLi4uIHRoZXkgZG8gbm90IHdvcmsgZm9yIG1lIGVpdGhl
ci4NCj4gDQo+IFNvIGlmIHRoZXkgd2VyZSBub3Qgd29ya2luZyBiZWZvcmUsIG1heWJlIGl0J3Mg
cmlnaHQgbm90IHRvIGVudW1lcmF0ZQ0KPiB0aGVtID8NCj4gDQo+PiByZWNlaXZlIGZyYW1lcywg
YW5kIEkgY2FuJ3QgZXZlbiBzZXQgMTI4MHg3MjAgYXQgYWxsLCBJIGdldCAtRUlOVkFMDQo+IA0K
PiBCZSBhd2FyZSB0aGF0IERWUCBtb2RlIHByZXZlbnRzIHlvdSBmcm9tIHNldHRpbmcgYSBmb3Jt
YXQgaWYgdGhlDQo+IGN1cnJlbnRseSBzZWxlY3RlZCBmcmFtZXJhdGUgaXMgc2FpZCB0byBiZSAi
bm90IHN1cHBvcnRlZCIgZm9yIHRoYXQNCj4gZm9ybWF0DQo+IA0KPj4NCj4+IFNvIEkgYXNzdW1l
IHlvdSBoYXZlIGJlZW4gcmV3b3JraW5nIHRoZSBmcmFtZSBzaXplcy4NCj4+DQo+PiBXaXRoIHlv
dXIgc2VyaWVzLCBJIGhhdmUgdGVzdGVkIFJHR0IgYXQgMTI4MHg3MjAgLCAxOTIweDEwODAgLg0K
Pj4gSSBhbHNvIHRlc3RlZCBZVVlWIGF0IDY0MHg0ODAgYW5kIFJHQjU2NV9MRSBhdCA2NDB4NDgw
Lg0KPj4NCj4+IEkgY2FuJ3QgZ28gaGlnaGVyIHdpdGggdGhlIFlVWVYvUkdCNTY1LCBJIGRvbid0
IHJlY2VpdmUgZnJhbWVzIGFueW1vcmUuDQo+IA0KPiBBaCwgSSB3b25kZXIgaWYNCj4gMDdiNDlh
YzU5ZmQ5IG1lZGlhOiBvdjU2NDA6IEZpeCBkdXJhdGlvbnMgdG8gY29tcGx5IHdpdGggRlBTDQo+
IDgyYWViZjRiNzMxNCBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgYW5hbG9nIGNyb3AgcmVjdGFuZ2xl
cw0KPiANCj4gTWlnaHQgaGF2ZSBpbXBhY3RlZCBEVlAuLi4NCj4gDQo+IFNob3VsZCBJIGtlZXAg
c2VwYXJhdGUgZmllbGRzIGZvciBNSVBJIG1vZGUgYW5kIGxlYXZlIHRoZSB0b3RhbHMgZm9yDQo+
IERWUCB1bnRvdWNoZWQgPw0KDQpIaSBKYWNvcG8sDQoNCkkgdGVzdGVkIGFnYWluIHdpdGhvdXQg
eW91ciBzZXJpZXMsIGFuZCBJIGNhbiBjYXB0dXJlIFlVWVYgZGlyZWN0bHkgDQpAMTI4MHg3MjAg
LCB3aGljaCBkb2VzIG5vdCB3b3JrIGFueW1vcmUgd2l0aCB5b3VyIHBhdGNoZXMuDQoNClRoZSBp
bWFnZSBoYXMgc29tZSBiYWQgcGl4ZWxzIGluIGl0LCBidXQgc3RpbGwsIGNhcHR1cmUgaXMgcHJl
dHR5IGdvb2QuIA0KSSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0J3MgYSB0aW1pbmcgcHJvYmxlbSBv
biBjYXB0dXJpbmcgcGl4ZWxzLCBJIA0KdXBsb2FkZWQgaXQgaGVyZSBzbyB5b3UgY2FuIGhhdmUg
YSBsb29rIDoNCg0KaHR0cHM6Ly9pYmIuY28vWXQ4YzBkSg0KDQpFdWdlbg0KDQo+IA0KPiBUaGFu
a3MgYWdhaW4gZm9yIHlvdXIgdmVyeSB1c2VmdWwgdGVzdGluZw0KPiANCj4gDQo+PiBJIGNhbid0
IGdvIGhpZ2hlciB3aXRoIHRoZSBiYXllciB0byAyNTkyeDE5NDQgLiBCdXQgdGhpcyBkaWQgbm90
IHdvcmsNCj4+IGJlZm9yZSB5b3VyIHBhdGNoZXMgZWl0aGVyLg0KPj4+DQo+Pj4+DQo+Pj4+Pg0K
Pj4+Pj4+IEkgbWFuYWdlZCB0byBnZXQgaXQgd29ya2luZyBmaW5lIGF0IDY0MHg0ODAgLg0KPj4+
Pj4+DQo+Pj4+Pj4gVGhlIHNlbnNvciBsb29rcyB0byByZXBvcnQgdmFsaWQgZnJhbWVzaXplcyBm
b3IgdGhpcyBtYnVzIGNvZGUgOg0KPj4+Pj4+DQo+Pj4+Pj4gIyB2NGwyLWN0bCAtZCAvZGV2L3Y0
bC1zdWJkZXYxIC0tbGlzdC1zdWJkZXYtbWJ1cy1jb2Rlcw0KPj4+Pj4+IFxpb2N0bDogVklESU9D
X1NVQkRFVl9FTlVNX01CVVNfQ09ERSAocGFkPTApDQo+Pj4+Pj4gICAgICAgICAgICAgMHg0MDAx
OiBNRURJQV9CVVNfRk1UX0pQRUdfMVg4DQo+Pj4+Pj4gICAgICAgICAgICAgMHgyMDA2OiBNRURJ
QV9CVVNfRk1UX1VZVlk4XzJYOA0KPj4+Pj4+ICAgICAgICAgICAgIDB4MjAwZjogTUVESUFfQlVT
X0ZNVF9VWVZZOF8xWDE2DQo+Pj4+Pj4gICAgICAgICAgICAgMHgyMDA4OiBNRURJQV9CVVNfRk1U
X1lVWVY4XzJYOA0KPj4+Pj4+ICAgICAgICAgICAgIDB4MjAxMTogTUVESUFfQlVTX0ZNVF9ZVVlW
OF8xWDE2DQo+Pj4+Pj4gICAgICAgICAgICAgMHgxMDA4OiBNRURJQV9CVVNfRk1UX1JHQjU2NV8y
WDhfTEUNCj4+Pj4+PiAgICAgICAgICAgICAweDEwMDc6IE1FRElBX0JVU19GTVRfUkdCNTY1XzJY
OF9CRQ0KPj4+Pj4+ICAgICAgICAgICAgIDB4MTAxNzogTUVESUFfQlVTX0ZNVF9SR0I1NjVfMVgx
Ng0KPj4+Pj4+ICAgICAgICAgICAgIDB4MTAwYTogTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNA0K
Pj4+Pj4+ICAgICAgICAgICAgIDB4MTAxMzogTUVESUFfQlVTX0ZNVF9CR1I4ODhfMVgyNA0KPj4+
Pj4+ICAgICAgICAgICAgIDB4MzAwMTogTUVESUFfQlVTX0ZNVF9TQkdHUjhfMVg4DQo+Pj4+Pj4g
ICAgICAgICAgICAgMHgzMDEzOiBNRURJQV9CVVNfRk1UX1NHQlJHOF8xWDgNCj4+Pj4+PiAgICAg
ICAgICAgICAweDMwMDI6IE1FRElBX0JVU19GTVRfU0dSQkc4XzFYOA0KPj4+Pj4+ICAgICAgICAg
ICAgIDB4MzAxNDogTUVESUFfQlVTX0ZNVF9TUkdHQjhfMVg4DQo+Pj4+Pj4gIyB2NGwyLWN0bCAt
ZCAvZGV2L3Y0bC1zdWJkZXYxIC0tbGlzdC1zdWJkZXYtZnJhbWVzaXplcyBwYWQ9MCxjb2RlPTB4
MjAwOA0KPj4+Pj4+IGlvY3RsOiBWSURJT0NfU1VCREVWX0VOVU1fRlJBTUVfU0laRSAocGFkPTAp
DQo+Pj4+Pj4gICAgICAgICAgICAgU2l6ZSBSYW5nZTogMTYweDEyMCAtIDE2MHgxMjANCj4+Pj4+
PiAgICAgICAgICAgICBTaXplIFJhbmdlOiAxNzZ4MTQ0IC0gMTc2eDE0NA0KPj4+Pj4+ICAgICAg
ICAgICAgIFNpemUgUmFuZ2U6IDMyMHgyNDAgLSAzMjB4MjQwDQo+Pj4+Pj4gICAgICAgICAgICAg
U2l6ZSBSYW5nZTogNjQweDQ4MCAtIDY0MHg0ODANCj4+Pj4+PiAgICAgICAgICAgICBTaXplIFJh
bmdlOiA3MjB4NDgwIC0gNzIweDQ4MA0KPj4+Pj4+ICAgICAgICAgICAgIFNpemUgUmFuZ2U6IDcy
MHg1NzYgLSA3MjB4NTc2DQo+Pj4+Pj4gICAgICAgICAgICAgU2l6ZSBSYW5nZTogMTAyNHg3Njgg
LSAxMDI0eDc2OA0KPj4+Pj4+ICAgICAgICAgICAgIFNpemUgUmFuZ2U6IDEyODB4NzIwIC0gMTI4
MHg3MjANCj4+Pj4+PiAgICAgICAgICAgICBTaXplIFJhbmdlOiAxOTIweDEwODAgLSAxOTIweDEw
ODANCj4+Pj4+PiAgICAgICAgICAgICBTaXplIFJhbmdlOiAyNTkyeDE5NDQgLSAyNTkyeDE5NDQN
Cj4+Pj4+PiAjDQo+Pj4+Pj4NCj4+Pj4+PiBidXQgdGhlIElTQyBkb2VzIG5vdCByZWNlaXZlIGFu
eSBmcmFtZXMgYXQgMTAyNHg3NjggYW5kIDE5MjB4MTA4MC4NCj4+Pj4+DQo+Pj4+PiBBcmUgMTA4
MHAgYW5kIDEwMjR4NzY4IHdvcmtpbmcgd2l0aG91dCB0aGlzIHNlcmllcyBhcHBsaWVkIG9uIHlv
dXINCj4+Pj4+IHNldHVwID8NCj4+Pj4NCj4+Pj4gSSByZW1lbWJlciB0aGV5IHdlcmVuJ3Qgd29y
a2luZyBiZWZvcmUgZWl0aGVyLg0KPj4+Pg0KPj4+PiBJIGRvbid0IGtub3cgZXhhY3RseSB0byB3
aGljaCBwYXRjaGVzIHRvIGFkZCBteSBUZXN0ZWQtYnkgLCBhcyBJIGhhdmUNCj4+Pj4gbm90IHRl
c3RlZCB0aGUgZXhwbGljaXQgcGF0Y2ggYmVoYXZpb3IgZm9yIGVhY2ggcGF0Y2ggKGUuZy4gd2hl
cmUgeW91DQo+Pj4+IGFkZCBIQkxBTksgY29udHJvbCwgSSBoYXZlIG5vdCB0ZXN0ZWQgdGhhdCAp
Lg0KPj4+Pg0KPj4+DQo+Pj4gSSB0aGluayBpdCdzIGdvb2QgZW5vdWdoIG1ha2luZyBzdXJlIEkg
aGF2ZSBub3QgYnJva2UgRFZQLg0KPj4+DQo+Pj4gQXMgeW91IGNhbiBzZWUgdGhlIGRyaXZlciBu
b3cgYmVoYXZlcyBpbiB0d28gZGlmZmVyZW50IHdheXMgaW4gRFZQIGFuZA0KPj4+IE1JUEkgbW9k
ZS4gVGhlIERWUCB3b3JrcyBhcyBpdCB1c2VkIHRvLCBhbmQgdGhlIGZyYW1lcmF0ZSBpcw0KPj4+
IGNvbnRyb2xsZWQgYnkgc19mcmFtZV9pbnRlcnZhbCwgdGhlIGZyYW1lIHNpemUgaXMgZml4ZWQg
YW5kIHRoZSBQQ0xLDQo+Pj4gaXMgY29tcHV0ZWQgZHlhbmljYWxseSB0byBhY2NvbW9kYXRlIHRo
ZSByZXF1aXJlZCBGUFMuIEluIE1JUEkgbW9kZSB0aGUNCj4+PiBmcmFtZXJhdGUgaXMgY29udHJv
bGxlZCBieSBjaGFuZ2luZyB0aGUgdmVydGljYWwgYmxhbmtpbmdzLiBUbyBlYWNoDQo+Pj4gbW9k
ZSBhIHBpeGVsIHJhdGUgaXMgYXNzaWduZWQgYW5kIHVzZXJzcGFjZSBjaGFuZ2VzIHRoZSBmcmFt
ZSBkdXJhdGlvbg0KPj4+IGJ5IGNoYW5naW5nIGJsYW5raW5ncy4gVGhlIG1vc3Qgb2J2aW91cyBn
YWluIGlzIHRoYXQgdGhlIGZyYW1lIHJhdGUgaXMNCj4+PiBjb250cm9sbGFibGUgaW4gYSBjb250
aW51b3VzIGludGVydmFsIGluc3RlYWQgb2YgYmVpbmcgbGltaXRlZCB0byBhDQo+Pj4gZmV3IGZp
eGVkIHZhbHVlcy4gSXQgaXMgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGFsbCBkcml2ZXJzIHNob3Vs
ZCBiZQ0KPj4+IG1vdmVkIHRvIHRoaXMgbW9kZWwgYW5kIHNfZnJhbWVfaW50ZXJ2YWxsIHNob3Vs
ZCBiZSBkcm9wcGVkLCBidXQNCj4+PiB1bmZvcnR1bmF0ZWx5IHNvbWUgYnJpZGdlIGRyaXZlcnMg
aW4gbWFpbmxpbmUgc3RpbGwgZGVtYW4gdGhhdC4NCj4+Pg0KPj4+IElmIHlvdSBhcmUgaW50ZXJl
c3RlZCwgSSB0aGluayB0aGUgRFZQIG1vZGUgc2hvdWxkIGJlIG1vdmVkIHRvIHVzZSB0aGUNCj4+
PiBzYW1lIG1lY2FobmlzbSBhcyBNSVBJIG1vZGUuIEkgY2FuJ3QgdGVzdCBzbyBJIGhhdmVuJ3Qg
ZG9uZSBzbyBpbiB0aGlzDQo+Pj4gc2VyaWVzLg0KPj4+DQo+Pj4gRm9yIG5vdyBJIHRoaW5rIGl0
J3MgZW5vdWdoIHRvIG1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gcmVncmVzc2lvbnMgaW4NCj4+PiBE
VlAgbW9kZS4NCj4+Pg0KPj4+IEZvciB0aGUgdGFnLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGFwcHJv
cHJpYXRlIHRvIGFkZCBpdCB0byB0aGUNCj4+PiBmb2xsb3dpbmcgb25lOg0KPj4+DQo+Pj4gOTFh
ZTY2N2IwZDQ3IG1lZGlhOiBvdjU2NDA6IExpbWl0IGZyYW1lX2ludGVydmFsIHRvIERWUCBtb2Rl
IG9ubHkNCj4+Pg0KPj4+PiBJcyB0aGVyZSBzb21ldGhpbmcgcGFydGljdWxhciB5b3Ugd291bGQg
bGlrZSBtZSB0byB0cnkgLCBleGNlcHQgbXkgdXN1YWwNCj4+Pj4gaW1hZ2UgY2FwdHVyZXMgPw0K
Pj4+DQo+Pj4gUkdCODg4IGlzIHdlaXJkIG9uIGJvdGggdGhlIHBsYXRmb3JtcyBJJ3ZlIHRlc3Rl
ZCBvbiBhbmQgSSBjYW5ub3QgZ2V0DQo+Pj4gY29sb3JzIHJpZ2h0LiBEb2VzIHlvdXIgcGxhdGZv
cm0gc3VwcG9ydCBSR0I4ODggPw0KPj4NCj4+IEkgY2FuJ3QgdGVzdCB0aGlzIG9uZSB1bmZvcnR1
bmF0ZWx5LiBJdCdzIGEgMVgyNCAuIEkgaGF2ZSBvbmx5IDggYml0cw0KPj4gY29ubmVjdGVkLCBz
byB1bmxlc3MgeW91IGNhbiBtYWtlIHRoaXMgYSAzeDggLCB0aGVyZSBpc24ndCBhbnl0aGluZyBJ
DQo+PiBjYW4gZG8uDQo+Pg0KPj4+DQo+Pj4gVGhhbmtzDQo+Pj4gICAgIGoNCj4+Pg0KPj4+DQo+
Pj4+DQo+Pj4+DQo+Pj4+IEV1Z2VuDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhhbmtzIGFnYWluIGZv
ciB0ZXN0aW4hDQo+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBXaGF0IEkgY2FuIHNheSBp
cyB0aGF0IHRoZSByYXcgYmF5ZXIgZm9ybWF0IHdvcmtzIGF0IDE5MjB4MTA4MCAsIGZyYW1lcw0K
Pj4+Pj4+IGFyZSByZWNlaXZlZCBjb3JyZWN0bHkuDQo+Pj4+Pj4NCj4+Pj4+PiBUaGFua3MsDQo+
Pj4+Pj4gRXVnZW4NCj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiB2MSAtPiB2MjoNCj4+Pj4+Pj4g
LSByZXdvcmsgdGhlIG1vZGVzIGRlZmluaXRpb24gdG8gcHJvY2VzcyB0aGUgZnVsbCBwaXhlbCBh
cnJheQ0KPj4+Pj4+PiAtIHJld29yayBnZXRfc2VsZWN0aW9uIHRvIHJlcG9ydCB0aGUgY29ycmVj
dCBCT1VORCBhbmQgREVGQVVMVCB0YXJnZXRzDQo+Pj4+Pj4+IC0gaW1wbGVtZW50IGluaXRfY2Zn
DQo+Pj4+Pj4+IC0gbWlub3Igc3R5bGUgY2hhbmdlcyBhcyBzdWdnZXN0ZWQgYnkgTGF1cmVudA0K
Pj4+Pj4+PiAtIHRlc3Qgd2l0aCAxIGRhdGEgbGFuZQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGFua3MN
Cj4+Pj4+Pj4gICAgICAgIGoNCj4+Pj4+Pj4NCj4+Pj4+Pj4gSmFjb3BvIE1vbmRpICgyMyk6DQo+
Pj4+Pj4+ICAgICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBwaXhlbCByYXRlIHRvIG1vZGVzDQo+Pj4+
Pj4+ICAgICAgIG1lZGlhOiBvdjU2MDQ6IFJlLWFycmFuZ2UgbW9kZXMgZGVmaW5pdGlvbg0KPj4+
Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBZGQgb3Y1NjQwX2lzX2NzaTIoKSBmdW5jdGlvbg0K
Pj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBc3NvY2lhdGUgYnBwIHdpdGggZm9ybWF0cw0K
Pj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBZGQgTElOS19GUkVRIGNvbnRyb2wNCj4+Pj4+
Pj4gICAgICAgbWVkaWE6IG92NTY0MDogVXBkYXRlIHBpeGVsX3JhdGUgYW5kIGxpbmtfZnJlcQ0K
Pj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgQ1NJLTIgY2xvY2sgdHJlZQ0KPj4+
Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgdGltaW5ncyBwcm9ncmFtbWluZw0KPj4+
Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBGaXggNzIweDQ4MCBpbiBSR0I4ODggbW9kZQ0KPj4+
Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgYW5hbG9nIGNyb3AgcmVjdGFuZ2xlcw0K
Pj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBSZS1zb3J0IHBlci1tb2RlIHJlZ2lzdGVyIHRh
Ymxlcw0KPj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBSZW1vdmUgb3Y1NjQwX21vZGVfaW5p
dF9kYXRhDQo+Pj4+Pj4+ICAgICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBIQkxBTksgY29udHJvbA0K
Pj4+Pj4+PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBZGQgVkJMQU5LIGNvbnRyb2wNCj4+Pj4+Pj4g
ICAgICAgbWVkaWE6IG92NTY0MDogRml4IGR1cmF0aW9ucyB0byBjb21wbHkgd2l0aCBGUFMNCj4+
Pj4+Pj4gICAgICAgbWVkaWE6IG92NTY0MDogSW1wbGVtZW50IGluaXRfY2ZnDQo+Pj4+Pj4+ICAg
ICAgIG1lZGlhOiBvdjU2NDA6IEltcGxlbWVudCBnZXRfc2VsZWN0aW9uDQo+Pj4+Pj4+ICAgICAg
IG1lZGlhOiBvdjU2NDA6IExpbWl0IGZyYW1lX2ludGVydmFsIHRvIERWUCBtb2RlIG9ubHkNCj4+
Pj4+Pj4gICAgICAgbWVkaWE6IG92NTY0MDogUmVnaXN0ZXIgZGV2aWNlIHByb3BlcnRpZXMNCj4+
Pj4+Pj4gICAgICAgbWVkaWE6IG92NTY0MDogQWRkIFJHQjU2NV8xWDE2IGZvcm1hdA0KPj4+Pj4+
PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBZGQgUkdCODg4L0JHUjg4OCBmb3JtYXRzDQo+Pj4+Pj4+
ICAgICAgIG1lZGlhOiBvdjU2NDA6IFJlc3RyaWN0IHNpemVzIHRvIG1idXMgY29kZQ0KPj4+Pj4+
PiAgICAgICBtZWRpYTogb3Y1NjQwOiBBZGp1c3QgZm9ybWF0IHRvIGJwcCBpbiBzX2ZtdA0KPj4+
Pj4+Pg0KPj4+Pj4+PiAgICAgIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIHwgMTE0MyArKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4+Pj4+Pj4gICAgICAxIGZpbGUgY2hh
bmdlZCwgODMwIGluc2VydGlvbnMoKyksIDMxMyBkZWxldGlvbnMoLSkNCj4+Pj4+Pj4NCj4+Pj4+
Pj4gLS0NCj4+Pj4+Pj4gMi4zNS4wDQo+Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4NCj4+DQoNCg==

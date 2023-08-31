Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D4B78ECD3
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 14:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244060AbjHaMOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 08:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjHaMOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 08:14:20 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2135.outbound.protection.outlook.com [40.107.215.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053FCCDB;
        Thu, 31 Aug 2023 05:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcOb3RpeX6ARNaKogUlBkJdOF1gti5C7ueomNrXBU3aWimJj3TcY2TCigKrFW6oxg3A7xVhLxbc2Z4elgNtd8aKliyiADEpLaegmMRlaa0kmsMqvW52QJRqmtR+jFe/vz7p05iKTQOzLofxmS2lbZyCYNAZ2CQQsnMrgAiMLfe9+lXLforYqVHK1afWYlOjmjTutCNzOIOVjzArSNOLixpw1Jbzz8WL87LCscae5RrySI8erQoG4Nw9KOOALfWCp+Nw5EnSlWgYosj7J7dNP9Wgvh0WQwee9vsy2cqLinDGxtEpldcoHwHg4NYHJF6PBw7oaXlj4vPg0IuCcbFlzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dznaFVogfRqivBp9395Rm3mvT7q6Vw6N2TXPEatct8M=;
 b=WBq0psyWMMqgQpAOVM6EBpQDLy0oreyQgDpyE/0IZtIapLpIfoIirEjGkiTaQQtu/Oh3kT3NCl1H+rWuoX/MP9RdBbhLi9NfMD2AGfy9IYwZvKjMh1/uNFfFnSZcl4yn6sYcuqwnuWTMMOVHCUU5M3wYFSbutPp0QAIvS7u5SWUJvpA5jzOKq/R9A8qdB4Bqv8cqd+awy9KFw4nijqs3qBsWUvCSwpMWX00Rg6viMP7Td7Q7twtxC0Y4wr3WtClo6ltFlve00OBxbr8uqTSTvGts0skzGxlxPv8+zpxW9MUOQ4dwn9ULvNcMrhswL3CC9UmAzT9cEL1+beb2Ohhm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dznaFVogfRqivBp9395Rm3mvT7q6Vw6N2TXPEatct8M=;
 b=bAr7kqPYQUJ8BpKz2G1t8ZN29Yg4hjjisjU60EjFmo+1F9ttUcfHeSriTfSLxSk+owH56O+sN7G6+ss4igVOr5Mm5ukFArFaCVZnkWdBHAU/37MBlta/Yq1cJ9eGL3ERs1dmbwQPwTrZf1fFMuWch6qSMnYW0+Q7IG32eWB2vRphazQ697rqmGWIsngPwVIQGVjlwKBvNu7+WXjMDXqRZjNNmLiv07KHgugzbZQAWiIlYlJDpOSx/7bEPc0vxqDN0y7Soyy4UvBL1qc7KRFa2Gbow6dC4Kc3wMr7eFLtJSyvzcOLjW+Vilra+qSFKXTze6TWottr64gX1bgS7ImxHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by TYSPR03MB7521.apcprd03.prod.outlook.com (2603:1096:400:411::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 12:13:28 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:13:27 +0000
Message-ID: <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
Date:   Thu, 31 Aug 2023 20:13:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To:     Sean Young <sean@mess.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <ZO2gvMl2IS70ve3T@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|TYSPR03MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ffd36f-71ff-47da-017a-08dbaa1bae0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G73KZRe0cxxJ3xHRV2oTW4nHUAkT8LZbX6YdHFlMU0aFqnlktIdNGbGeOhL3uymSbsucanCdrhHgSS/6i5xTbeQ5No9OMB3uZ00LjzoianyOXBqJ2g7vzBoY/tdtdUZMg4xCKN/sxmLT62SPtdAFrSNXWvfKUniWFDa0pI75APf9M0tMlC5rAro23f9L17j3FmC8/V9AQr2DkrpYlR8Ir/1IS4EgnBvgFWc9QvTIR87fhDohqdZ4k4x8QVtRVYQ7qz8laPZh6IQgBo06V3MyAwtAz9It3cNyCcWlOkiD00VgweGyA/H5XszGxpBnVTEMUD+RkF5VnCuWDaf7j5nFqgwiTHsbPfOxmfCoeoCKpgn9Z7w6EB0CxcCRye4/TjKCkdpa3OCdAKiC5IsK7Uut/duUZDApqxIFGfraMwD9rknKrM+UiVa2S81R1nMnyqDGCbj82YSrav/DFQBJiS2RjNfCyUmbmW9MdPawwK4m6KOqJBSVmMbIQRl6UPMF8ihTif4jDvNaR/viAV08FCn36LGKIcxuiu2yYArfEKkEKDBSGB35WxeRBy9LW2fAuMZ/oxeB+7IpD8cnS1nsXoANzK8qGqN92jyS+u17G7j1zMQ8HoFiR1OKrap2evb0ihb4+w7og7eBI17fZgxE53MMxc7Ha4fUddE7LzGcD8aSsWhKWbpbDRX/GjDUHwFrAPh/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39850400004)(451199024)(1800799009)(186009)(6666004)(6486002)(6506007)(6512007)(478600001)(2616005)(107886003)(2906002)(26005)(7416002)(316002)(66556008)(6916009)(66476007)(54906003)(41300700001)(5660300002)(4326008)(8676002)(8936002)(36756003)(86362001)(38100700002)(31696002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktPOWd3TDZrT01ZV0IyVEZUckNVS25zT2Y4YXNzUXlHRWNPV2VBWnluTVEz?=
 =?utf-8?B?VURscTNVaGRWQVBpNVhPZmlkVkRQMkxLNDlSYW1SQkpTT3REUis2T3pMcGN3?=
 =?utf-8?B?NFVEcjI1ZENPaWg1c2ZhOG41cXBEZ1pHK1lXR21ObFQra3lzMTdzVXNIWDBi?=
 =?utf-8?B?ay9uWnRSU0xieTdqdkJJMS9qWXAwY1NEbDFQTWg2TTFYaFhEOWxHRzJRS3Vz?=
 =?utf-8?B?UHQ0RHJwdXdRTFBScWlyd3E2U1A4SXNBQXJpVGpWaTljL1J6cEVsMk9iVCtU?=
 =?utf-8?B?TGZQYU10M25pV2trRFJlaUlSREZjK3kxVGp6dXFHR0YwajdLd251ZDc5R3dh?=
 =?utf-8?B?Z005SFJRekg5YXdTMngvZXFBK1RVZ2lHeTZJUUdlY1VQZUhwdGpIclcwTk1t?=
 =?utf-8?B?U21SUVJrVjdUeVUrY1luTitxTHpUamhTTmhYMUhlUUIvdHMwcm8vd3l3TDNF?=
 =?utf-8?B?ZCtjdnhpZVpQalBxV0ZYY1pPQVJDMWpESHVHQTdJeUNkZUg2V1duSmNhN0ZN?=
 =?utf-8?B?TnpZNFZyLzNTaFk1N0pZZTA1QVlMd3hZZU14d3IrT2JNZmc0OTlWNlJETzNt?=
 =?utf-8?B?M0tLdFY2L1RkaEpDcXF6bDBmbUNQdjZBME5vUXdKMi9VRXRHd2NmeUQyVUtx?=
 =?utf-8?B?U05tUk9jTGJqcS9jZC9zanJGTVZlNUszdnhEQ1pxK0xOWG5kYk5EM2s2VnNE?=
 =?utf-8?B?bk9oOTI4NE5jRmVjekkxd2h6U3VXa3RPK1FXMUtIbDNOUVVZNmVpL1pvYWtN?=
 =?utf-8?B?QkdCcHpRWm8zOFBuTlBFdGxNVHA2STRHLzFBRDZDaDdQSno4RnpNSmNzZ0Er?=
 =?utf-8?B?OVZlTzFCREhvODRZRGlGSU9Dc2JkQXRUOU9tVUprUkdFMnJSOGxzSjUyVlBT?=
 =?utf-8?B?WXpaMTlEWGRLb3FhazFtZGYzdWlDdFpsK2dSZjdPMTdZM2llYWhEYlVtUmhM?=
 =?utf-8?B?ZkN4NnJzRmovOEE3d01iRDl5UlBYSnBoSFNsdjBnNzVjZVR1V3BIOXRVMDNk?=
 =?utf-8?B?d0owaTBmMWkzMG5FWnFWUHA5a29qZ2hCVHJsRElkWDFWQ0xXZ0QwemU2NTd4?=
 =?utf-8?B?TDM2V0crUy9pWWpud1oxck94Y21KRThSVUswSjIrajFMNjFWcXJWdlM5cHc3?=
 =?utf-8?B?L1hvcTFSYVdtRldRaUJOdjI1YjBjNUtISDRMb2lheGlYWWNGRVFkSElsaXF5?=
 =?utf-8?B?OGZoZ29kZmRHY1M4Zk5KYzQwbVcvb1FEbWIrVVJVT1YrYjkvYkpkdmhta25U?=
 =?utf-8?B?N1ZybENMZytucDhzMDZ0dnZBN1RGdGZLdlY0TU9hby80SXh1K1JyeTk0TFBp?=
 =?utf-8?B?THpnT0VQc3JjMUhQK3ZGMFFZYVBQQitnT2JhVERjZkREdVMxU3ZvbE1vSGtC?=
 =?utf-8?B?RS80RkRwSDVRYWxqOThna2JXZ29DRWkwMklkMG5rWG54S0R6M0g0eER5ZG9h?=
 =?utf-8?B?UW9vTzBEVjBUbkV0Nk14MmhwdE1kYUlKNWhwTjVmeDZvakRFM0lBcExUc1RJ?=
 =?utf-8?B?UkhsTUk4SWluRUp6K2tnM3FNR0xzTEJQb0RnYVdOMk91eWhpeU44QXcwS2R1?=
 =?utf-8?B?b05RcW9rZUt4alVRZnZXOGYrN1N6MURaY3VaQ3RIU1IvN2JHNWw2OW5FT3Yy?=
 =?utf-8?B?K3JSWHRPcmxrVU1ybk41dEdxZnlCR2JYWUpaQS9ZTDFaMDBCbXZsL2lHN0Fx?=
 =?utf-8?B?azREazdGWWRRdkhBNEZRVFQ5WkZBelU4aHhQSmg1eWhkcEY4NkMzM25leGF3?=
 =?utf-8?B?cS9jVStwVzhLejdhNHdPTGR4VVJMcy9ScW9LeTYvQnF2eFYwSjUwUEFqNXZo?=
 =?utf-8?B?YkhrYUo1OEdIdkgxUGxYalVNOUpwN1ZuRlMzQWZ2MDNRSC9rRzdwdFRVQkd5?=
 =?utf-8?B?NnhLUVMvemcyNzRZdzh6TzFFQ1ppSHNUeGFOMWlLcG9INTJpTGx1c1lUejZl?=
 =?utf-8?B?Y09VUkI5ZVBDV3lIVHlPbHIyZGJVRTNHMFVHbFZ2UktWczNGUWZoZ01ZS3ps?=
 =?utf-8?B?Z3FxMlRYNmJacUtEYXZwM3A2bTF6a2ZERTVqQkRHcDI3RWdqWUovNUtXMG5o?=
 =?utf-8?B?cUo0RXNDWE95d1hZdDV3a21rcVZwTGNmNGtzTWxzWVBvN1lRR050YmZqZFo1?=
 =?utf-8?B?TFVUTENOVU5HeTFUcSs0aTJSNS9Oa0lGTysweS8ySGZFK0dTRVJwOXVSSDBu?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ffd36f-71ff-47da-017a-08dbaa1bae0c
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 12:13:27.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VBwvQb1kG8T89dAPiYZqwGZKQg7muVAlFstfU4AQXmhJa769TedtjAFH8KGZvF4PwJY4IrQIsbXDVnEb7safg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7521
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

在 2023/8/29 15:39, Sean Young 写道:
> On Fri, Aug 25, 2023 at 07:53:08PM +0800, zelong dong wrote:
>> From: Zelong Dong<zelong.dong@amlogic.com>
>>
>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>> SoC. So far, protocol NEC could be decoded by hardware decoder.
> On Meson-S4, only the hardware decoder for NEC can be used using this
> driver. Does the Meson-S4 hardware support software decoding? If
> software decoding could be used, then any protocol could be supported,
> not just NEC.
> 
> Also, out of interest, is there are documentation available for this
> hardware?
> 
> Thanks,
> 
> Sean
> 
Yes, IR driver still supports SW decoding on Meson-S4. The decode mode 
could be changed by 'support_hw_decoder'.
If IR Controller works in SW decoding, driver will be registered by 
RC_DRIVER_IR_RAW and allows all protocol.
Otherwise, driver will be registered by RC_DRIVER_SCANCODE and only 
allows NEC.

489         if (ir->rc->driver_type == RC_DRIVER_IR_RAW) {
490                 ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
491                 ir->rc->rx_resolution = MESON_RAW_TRATE;
492                 ir->rc->min_timeout = 1;
493                 ir->rc->timeout = IR_DEFAULT_TIMEOUT;
494                 ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
495         } else if (ir->rc->driver_type == RC_DRIVER_SCANCODE) {
496                 ir->rc->allowed_protocols = RC_PROTO_BIT_NEC;
497                 ir->rc->change_protocol = meson_ir_hw_decoder_init;
498         }

Do you get Meson-S4 datasheet? Please refer to chapter 13.5 Infrared Remote.

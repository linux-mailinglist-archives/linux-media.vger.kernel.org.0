Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527AD4D2D6B
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbiCIKww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiCIKwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:52:50 -0500
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30068.outbound.protection.outlook.com [40.107.3.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61558106B26;
        Wed,  9 Mar 2022 02:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn8EFS1Hld0IB1WUL7j1aQH2wBtnQoLcEz3CCskbVbhuWvO3NiMzgQwHSLesMaoJrDBvRibWiG3Obwf8vU7pcJgc59fnoZHD1CCuSVgFzwr/MJ8rxf1KXXRjgaJUtLgBn67xNt5VRTsu11xMNElC2J0dW/zkrwVb6FmRNgnfTa0HtdU2v85AeEPg5VJanI3v9O9Z31GBwLX/ZyzBsI4L7nPG8GANP0GVftsiWwmijZzZ+KAFl/JsM4T4bkO1Ad0xMYNo8OucurcLC+S3jibX0WW3ou/W9X+OrSzPjegsI//2oytkZ1i/K9gQN410SWCbhxLFNusNi+4DgOAviDvKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcL+/EPjOweOfYfSyvGyJifpoOJ9z2CjMN67usN2Twc=;
 b=Az/tjGsg4HgaCa4vEQs66VUoHY2Zew8vWbvEnTxMNDwvk24l99kb5zCukqiotXo4bDXntLRhu9zoV0fjvOz14WvHKZ9oiSjGOB/nKS845NEvRYIVikG5fD4ZtgLT6ZsVL9YF5AOVbqn0UPHC1UTZ2di0cdH9yQMAdLyXtFq9HVF3EhCRb9jJJHK9Sry6Ulh/+l7vt1P0eIpojPGNY10VhCDUEN6iNJD0q5NdbQxdi7SvHjQgoNou1dcUXDn8CbN4OaClSIxAEbQswIrqzXsANOd6737IcBRnadN3hqi8om3s0G4av8Zkc6ZYyx6lGTqNbPIpXR3JBihD8ur3QOuwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcL+/EPjOweOfYfSyvGyJifpoOJ9z2CjMN67usN2Twc=;
 b=Io50zhHyAj/24hJKSY2jU+fj4Qa+JVOXKVMAJKiGLz41z1/xNIHnBSzD4dcpK0fedWASy1jJslPlb8RcZdrcIBP/tkLQ0Bjtgr6RUUGveK4gjM4518XV8Uq09i91Q7HSD/DJZ8S4gbHo30jLgeXw5dSI3vTgnGLJE3J3vshUYLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB6PR04MB3189.eurprd04.prod.outlook.com (2603:10a6:6:3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.26; Wed, 9 Mar 2022 10:51:47 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:51:47 +0000
Message-ID: <4be5c5be-9bd6-fbbb-cf02-f4c289193603@oss.nxp.com>
Date:   Wed, 9 Mar 2022 11:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/9] media: dt-bindings: media: Add i.MX8MP DW100
 binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
 <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
 <20220309012350.GA1710752@robh.at.kernel.org>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <20220309012350.GA1710752@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::22) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c025e904-43a9-4923-2d11-08da01bacf03
X-MS-TrafficTypeDiagnostic: DB6PR04MB3189:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3189407B6A96D88B9E3F302BBA0A9@DB6PR04MB3189.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGC7s+LR22GnusgKFOYXQhkgjCsj25WHafh6UDDC9JeyUAJJySgs0MZWPtrRQLonrsG5hUGjz348a3Fmqgu4H3wOctw+6clH0g6sv5/jr6CZiRxX1wFJI0263VJ0XmsdVQRIHcjHkFjVxZVdKruTFQ04N9zyjqHWmdXuJsDrfiK6M4uDgXhqIbVdy1AGddzHNHxxllexWlUgvrJCKENSDgXCA3zTiY7Zy2/WMtiN1UEhsjFGBH8OuZW5dqQcZWjec/pZegZFmNL6l5RgTiY36iVhMMBqmoCsHtgqjzy1sUp5E4/55rs44Q7hVuX+mBDgNsfJzYLwc7bb7MUM5CFyvyYlA6qkUmXXCCxnP8PpsqI/IIFAvwyKh1xA6fFRfvhU2iIi3hJtxe3GRZIFvMXJYzKrhjwh7WywzR05A8Pk8VWC0NnsP1ImVif7AOeeNzzWKr3Ncp54MkVIItV0BI6clFvoUq365YfkgNpUOJAoouBr652FfsdxGgBMCy+KMCVxO1wKGI0QOdd0HMEQCXZKVSMKpP5p9ZK49DdBRZjjpBAW9UiRlFCQzkRrjndLzC9bSLob/2DwoNvdZUsa8OxeVpU0YVsB/Btr+F+MeRBc+EjDZBfD2gi7aJA06sSMsqF3umo0zBiBh5IM5/ncYk6rICmR3MKX1z1ggV0uyJQ6kOOmzbM47ZJ5S0jDU8xgJ680t27/KEpPMlOTs2FzSuL0b9+23CWIEEjGHknUEhp9eAZj2j1qNCJZM91If66Tm+wrKdZH3cc0qFVqZPMHmEX4DjMYK6cN8ZnACYkMmySCVSeRrD0M/OdPTJO+GxVsKJOLuasPPSaQaUgv1wJGPG/ATHgkYikbAqPhajpYz4btrZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(31696002)(86362001)(966005)(6486002)(53546011)(6512007)(6506007)(186003)(2616005)(498600001)(83380400001)(4326008)(66946007)(8676002)(66476007)(66556008)(5660300002)(31686004)(8936002)(2906002)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUU1VEcxejBJY3ZvZUwycEp3Q0pQWGNNNnZIeG9xbkdVQ3FVc1lrTWx0ZkJh?=
 =?utf-8?B?YmR0Wkk0NmtPZllYbm9sVUhuVzFUeE92WG85d2k4WG9GcGRuZkhwQ3poOGlr?=
 =?utf-8?B?T2o2SjcyYVRRSlN0L29TKzU2dFRJZllkNzdoSG1nUmlRUEVwSHo0NXhrM2Rx?=
 =?utf-8?B?TjBTQ3BTbDFjVHNuTnY2bTJPaXlpYnBucStwMVFKbVNXSktqRFVlRllYakky?=
 =?utf-8?B?cUZSS1BqMEhNRmVpM2p2ZTdnenFBMFR4eG93ZCtmZnJEN2sxK2FpZjJwYXph?=
 =?utf-8?B?a05vTjk0RW5CcWFzU3hjdVcvN3dKTE12RTN0K0l1WE5vZ3dSRmZBOGQxWjEz?=
 =?utf-8?B?QkZidmgycnRjVndCcWJTMGJlZXQ0K1RBUjd4R3k0Y0lBWE8xcDRidlFyUGpH?=
 =?utf-8?B?eGFmRXB2eWNOZDR6RU5UTzRXM1NFVUJqS3hQZ29EUUJaUkVyTjQzRUJJdzRx?=
 =?utf-8?B?YU9NLzI1bmpMVGp4eS9CcS9PUlhZWEFOQVNVaEFZVUk0Ri9hNDBuTGxQY2h2?=
 =?utf-8?B?MzY5TWlSbEd0RFpGWUN5bUx2TDIvYW9tNHhjWEM3N0YrTEkzRiszTmxBYmh5?=
 =?utf-8?B?anNzZlBNMThQY2pEQmRWbVhSTmpHZ0hwMExNUHN2SXV0c0o5clNsR2VjMmVq?=
 =?utf-8?B?ZC9WNHlYRkI1RzJURlE2Nmxwc0lPNUNNRWU0TU5BMW82ZzhBUkxoTFVDSk9h?=
 =?utf-8?B?RGhjeW00OVdMNWtvd002c2lXL1ZXbGNwdGcvZkJVRHdwSU1TbmVmMnpTV3VQ?=
 =?utf-8?B?ckxsblBMaFpYS2xTa3ZDaDhzYkkyOVdJRUJxaXdUazBGVElYbUFDdXRlQ20x?=
 =?utf-8?B?SXZ5cEdyUEUrVTlUNm54dUN6R1hkM3VsYzdKTXFYTnAvczN5bkhNRC94bW9y?=
 =?utf-8?B?Q1YySjkxZ1pFdkJYVGZ4bk1YeGRZd0MvWUVSMEI5RElMeFBlWUhyNHpaQWND?=
 =?utf-8?B?eVJ6eTJkVmpGeFdVbG04ZUFEblRTUmVzVFNMQ3pmNzNua3FwVmVwWHFZeUhN?=
 =?utf-8?B?aGhwdmhPSmFCYzhqbi9qYURhUWUxS0RLNHJJS1pXa0dwMUVpZXoybVkxOGls?=
 =?utf-8?B?UTU5Zm16dzAzWno2Ym5aZXNFcStHU3c1VUZMbzMwNktxbit4OFZaaHhNUWND?=
 =?utf-8?B?UU00eXp4bDZxVDNPT0RyYzV3RVFiR0R2RHd2T2pqMWpVN0h6NDFsU0tiSjc5?=
 =?utf-8?B?QlI0aHgwdUJwcGk1NnJidkNHVnFwZ01yS1NnZDBoZW5FTEEyUW94bk1XclBK?=
 =?utf-8?B?ZWNQeWJUK2g4SXZSb1BDUmZpUTJWR215RVBSaHlJL3dvQWtEYnVnWTU4S3N6?=
 =?utf-8?B?ck5haExpZ3JmSzYzRGJhSi9HMkI5V0MyVWVsUzh1bHAxblhHMzVlZTFQcmxa?=
 =?utf-8?B?OG5PbzV4K1pVQUdyVmdLMFl3LzZDRUdkTVMrVWhmSnRkZXIyT0daUHhIQjlR?=
 =?utf-8?B?TzlueUUxc1BnZW0rQXM2ZnBQNFVjbW40UmlPNFE4YUZyTHFqRjVoeldCcCs5?=
 =?utf-8?B?b1hJNVZIQzU5TmQvcFFDTE1VR3hqOEM3KzdBM1ZKL0FyK2hoRHl3WHFXWnZK?=
 =?utf-8?B?Yms5WW9MRzQ5dWpsOFIyVytQdWlLTzh5anRPWTlNWFBjYUVJWDY5bUN0YkxU?=
 =?utf-8?B?TlkrVG04VHpURVFCait3VnFKRWFXbE9ZSGdjS28zZHRPc0ZLV05VczBEWkxh?=
 =?utf-8?B?K0lPOS9qNE5lMzl1UWlYcjlDSzFHcm03NEJDM29ndFJhQkRKcmhPN0ZqbjE2?=
 =?utf-8?B?dU5kZGFma1F3TllpREpJaUh5cEVzV3VRYkVJUnliWThwUENWYmllVjVyd0lX?=
 =?utf-8?B?M2o5VWoyOUpVOHBIZWVSKzUyVFVPVzRYNTg2bFphZGNDVFlLNlJzeFRJWmxC?=
 =?utf-8?B?RmhPVS9pdlRjVDNtTUZaOWl1SktnOEVtNFkvaE9hUWlnQmNxaGZYNURNTnhK?=
 =?utf-8?B?WEQ1WDc4bVBJZHQrdjlZMVpYeVpreUJJdFNRczJ4QUNKbENSdEMzaFdvL001?=
 =?utf-8?B?MUpQRDc2RWk3SWQ4aXB1WHE1ZVE4bFlTVktxcmpYWVRVTUdWYU1mbWJqbGdv?=
 =?utf-8?B?cmJwSXBmN05ZVXZiTkxrcFV2T2xhcWU2a1FCd1lGZno5UnVYK3U1NStxWjRI?=
 =?utf-8?B?aGNFai9kY1dqalY3UVZJdnZHTlJIMnFFOGxVUHBNSzFXNFROQlFkL3FZSDZP?=
 =?utf-8?B?ZUNYSS84Tk1hODhpRUtiSnpGVEtXZ3RoR3BYajNKOUxvNU9VYy9DUFBzWWZJ?=
 =?utf-8?Q?qMPLGXuPDfNuNKwlmEoV06HsM4AHNgt2AqnrlpzCpk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c025e904-43a9-4923-2d11-08da01bacf03
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:51:47.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+AY6Kzee1bqH8Q/zELLjn6yFFGy8ApVSbWi7h9/jjkBeeE3heEhQl598JuO7O/eQOqDbWBLH/XFVuA32U6dfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3189
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/9/22 02:23, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 09:10:36PM +0100, Xavier Roumegue wrote:
>> Add DT binding documentation for the Vivante DW100 dewarper engine found
>> on NXP i.MX8MP SoC
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
>> new file mode 100644
>> index 000000000000..2c3b82be0b74
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/nxp,dw100.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX8MP DW100 Dewarper core
>> +
>> +maintainers:
>> +  - Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> +
>> +description: |-
>> +  The Dewarp Engine provides high-performance dewarp processing for the
>> +  correction of the distortion that is introduced in images produced by fisheye
>> +  and wide angle lenses. It is implemented with a line/tile-cache based
>> +  architecture. With configurable address mapping look up tables and per tile
>> +  processing, it successfully generates a corrected output image.
>> +  The engine can be used to perform scaling, cropping and pixel format
>> +  conversion.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,dw100
> 
> Version of h/w and features are all discoverable? If so, add a note to
> that effect. If not, needs to be SoC specific.
The id register is not used as it turns out to be RW, with 0 as reset 
value..Hence not used by the driver. According to the IP vendor, this 
version is a single variant IP.
Following this rationale, I would have been more accurate to suggest 
"nxp,dw100-v1" as compatible string.

Unless you prefer "nxp,dw100-v1", I will go for "nxp,imx8mp-dw100" in 
the next series.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: The AXI clock
>> +      - description: The AHB clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: axi
>> +      - const: ahb
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/imx8mp-power.h>
>> +
>> +    dewarp: dwe@32e30000 {
>> +            compatible = "nxp,dw100";
>> +            reg = <0x32e30000 0x10000>;
>> +            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
>> +                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
>> +            clock-names = "axi", "ahb";
>> +            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
>> +    };
>> -- 
>> 2.35.1
>>
>>

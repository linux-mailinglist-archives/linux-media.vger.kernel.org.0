Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86BB765C0E7
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 14:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjACNfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 08:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjACNfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 08:35:41 -0500
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2086.outbound.protection.outlook.com [40.107.247.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C9526FC
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 05:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB8jO3EUb9GtFU+EEDE5BpC5sKHyT/SK1gV5dBHFfOl2u0MW6gbityvzjrDBNos7xwxoJ/h601tItvBcKexzdhMtCAvkSFoImIbE4loqLxdQG65/4HUjltPOT1v9c2mRv7/X9FFnFazvC7VjiuTcOAuLcFJSa8m0yRu7yyIZI4E9j6xQyaUmkKFWOGoH8nhc2aPpHvN1i0G+QVqZAxL+LMwcApyh7b19nGNrik6rCfPcQaeAuvCAFOwt/lXuY2x89grXal9mKdta7aKhLiDz8eQKj6X8/r1o5XZGx6yX4a7Mqmnb95RTo8YDjd/hgcJtVZ6/r9WNvYM0XjD3LIqAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWZYEYeRqEVfHHLN11owDPSG9nUrRqCW1E4MeqnsJXE=;
 b=euIbgn8Dalg1crYG+kmwgMObNukdNjMx31QB9fzy2h48jdVYypQS1p0i56CDwANYUvjZFTY+SHz7MSBApKRsELjYkr7OCxTlfsPh8gFHtMTmzjQyUj5yfNOob/Kw82B6lwfjeMHcTD4btQLl4GVLE3s0y7EuJnRlId9bZeamdLdGLTNwKeOA3whX0DJpF7v+1aT0SvKAFVso/6v+nIWEl9ivSI/rPtfzgSLNGGeXqi2ucghqAhOdiKQGOPiYF48MKW7LJay5HDfjdsSou1Fmc7v86qP/6nG23GEZbaViJ1mjzO/0awS9dqjNCYzwga4LAQlVrgtzQ8Iao417HyFGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWZYEYeRqEVfHHLN11owDPSG9nUrRqCW1E4MeqnsJXE=;
 b=DU/nKoP2Vs/qH5qynu+0MKIz0Qer0cc2tlJ7R2XFYrGhOxG1hMNAqyACKSITbjoK81ryAT+9rtp/QyvOEOr5zxhPW+ynbA8iObwqjOuKlXPTBeTDGz8dO1EJFCXg6NWwCbdmW7sa1622BVHzbe8miMuNkJzdd1tKfk+XOSxbOLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 13:35:36 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::19a6:6003:3641:13b2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::19a6:6003:3641:13b2%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 13:35:36 +0000
Message-ID: <42a8016a-8922-236d-30a7-9b12b53a9bb9@oss.nxp.com>
Date:   Tue, 3 Jan 2023 14:35:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: dw100: Add a missing unwind goto in dw100_probe()
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
References: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com>
 <1962839.8hb0ThOEGa@steina-w>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <1962839.8hb0ThOEGa@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::39) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc55099-cd10-4f50-6ca7-08daed8f657e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qy3Mq0cjsqnyhqQtpn2WxnMS0lrQwICJZDNezENA3XejWBoSF2YDmfyvY9d+UEiDih4tZzyawuYbCNrZETJrSCoR8+zQDaBxe8n2IECoVLahYaLn3aVoSl5vubNxqF9is7vdp7VQbOztZ4aSzwe1PqvcLlxy1UHfoFhCjhoqEI1IH9XssDoE0lKPJ9n6LyaO0Bae653CzpxcTYjOxiSsR7LW1IGpbH8tfoiKeFVf43F4eVyKvKaXfHYNY72p3bYrzfQNg/CSFPL/dLeYvVUwLMV3MbgICrbVUrqQHCMNR8ueNOxVHha6ate9fV419E3HNut1ItpXJjOVqSz+Rkdh2miCvg1uF6CMZMCJrcI8MQ3SYpNj5rkIdrYNLvAgigGD1yvIuMTCgPZJ8B5utN3egK8PR3cuBFmnaJXXp0z07l8iF/Nyi315h/QTE3nyHCfZGFaGfQ7mP4bw+amKRI+6sVy0EtO9PCqY/8NzXzOjgpoU7ilNy1dbW/ScApxpW4J4tNz94x0mGrThjAO7nL5+1+ns19Ht8oVtf475oBKrQJAixLmLCkhFGBNueflbTN58wuvGCA6B+2tV166WhJriKvDWmznwO+/96whe30HuDDtBfysOZ3SiqEV4M02AWa9Y7c7W1q/i0VbU81Q1x5QSJAqVSThh8qaru3O4/cyYUaHjzLF8Iv+7DG+3P4TnYC+HUHNyPCx0I/CTaxmn911EtPu88+SyaCs/EaWyXEYjzKbAI5RS4wfLVKeKjbgA2wczGgm/y5zMqKGyTZ0KSpHxAzzF1epXYUjy2s8e0YLoeS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(5660300002)(2906002)(31686004)(4326008)(41300700001)(8676002)(8936002)(66476007)(66556008)(66946007)(54906003)(316002)(478600001)(6486002)(52116002)(53546011)(2616005)(26005)(186003)(6512007)(6506007)(83380400001)(38350700002)(38100700002)(31696002)(86362001)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVncXpUbWt5elNtckxsSHVzTXJtUVZlOTlWSTFnR1N1L1FRVzFCdGRJZm1E?=
 =?utf-8?B?dndaamxPbEZPRTRUaUNyUUNSK3ZBNUw4Qm5mQWJ0ZFUwK2RmMXRpYlRqd0Yx?=
 =?utf-8?B?dHB4aG4zeURkaGxkaFExK1pvM0hId1UzdkcrSXd1Z0lINHErUlFlaHUxeGJo?=
 =?utf-8?B?bWdRdGVwUWFiRVFNOTBnNXB5eUNNUWM3RzY0M1IwWllQcDU4SE14ME5TWE9B?=
 =?utf-8?B?Y2FBek5lV3N1NVdzNzd5NVNDcGtmRXRsRjhIZlVJaFJ4Y2F2Y0xLb2N1TEFY?=
 =?utf-8?B?UlpGcVZUTXEwa1RYQ3J2OTVqTzRHTjY3UFlmc1JjL0J6bWxKUlhtT25aTjZ2?=
 =?utf-8?B?RHVrSnBxdmlGQndtMjNkZDNqYXk4SnVLS2dQamgxVEhaUFR5d3Vod2hOcmsx?=
 =?utf-8?B?c3h5c0Q2VFZNWHA4VTA4S3lrRkZHOE4wVHFYNE5QbmZSRS9NM2NLNEx0MGhT?=
 =?utf-8?B?WXljZmNmbzRHUi9WK3FkWEYrWG1QQWxmRUFlZnlZVmNkWW15aUhvQnJMV3c4?=
 =?utf-8?B?ejgxUnZGY1ZFejB6QjQ4T1dNcjdqN3FZWE1CWmpybGtmR0VPWGlPZnJOVGd5?=
 =?utf-8?B?TXlTaW0vQ0xoMS9BbXJwOVBXTmM1WDJBWFVmeFpYdkk5bGU2WTgrRFd1STFV?=
 =?utf-8?B?UHpuQy9Oam4vRXF2UllOZVFMZ2hvSTkydks1NG9FZS9oMEFsWmFtL0N3WEpv?=
 =?utf-8?B?UU83SEZKMDlPcDZuV0hrdC85QXVxTXZrNHg3dnJ5ZExtRkZsSlVKM2U1VDFw?=
 =?utf-8?B?RTlPendLUlFTdG5DMnhXQlRucDZaTjUveVRtZ2ZGa3ZwRmJmTGpoU1FYRk5W?=
 =?utf-8?B?cnVvRWsrZWNUb3owS2VDUllWRm5JZGlRdjd5MGR2WW5ubURvMURReFJ1SjNQ?=
 =?utf-8?B?TTVZUE9DTjhqYjhPNjhQSTI1bHFCaHo0RkV0SzkxRkZJbExQRlhCOHlSNS9G?=
 =?utf-8?B?L1haTmJEUVZKRFcyd01SbVRoMnNmY0IwR0dyMVJWZzZ0c0ErTmRuZGQ5NG5Q?=
 =?utf-8?B?R210a0FjdlVrQmNEQmREd2FpbDRVNy9RYnB5WWFyNCtCbXpWb2t1Tld4UGxk?=
 =?utf-8?B?Rko1QmFRQmg3SFN0YnRETjhwOG5EZVdmbmUwWkQ2OFFVb200ZldJcWs5aEN1?=
 =?utf-8?B?Rm9wVFZybE1IbjllWStWK2VpbDZWNmtYSC91VjJCSHAvcWJtcGRKY2FLUjNH?=
 =?utf-8?B?STByS0lwQ042MG8vU3dFdFlpVGhTVXZ3bllNdndta3RMRWFUeWVGVm5od3lS?=
 =?utf-8?B?bURNS3BxdzM2T21iUE5wdzR2VkpHRUF6TU1jMHZWd004aVFHQXg5WjFEZEFN?=
 =?utf-8?B?bGFYQ1ZOOENSOEFDaGU4eVJvd2EvQXJScHZZNTRkei9sZU9GN2IydjFEMEpw?=
 =?utf-8?B?eHp0NlVWN25lajN5azhjRWpDZzBqT1U4RUNuTjRqNzllUGM2SjBFWXJBSlNM?=
 =?utf-8?B?VG5Wam1rUmNwYkUvK2pJTzRhSFRQeWk1VE9ZR2ZneFRhNk9VMmdVZWxRenIy?=
 =?utf-8?B?RVpuWUhIa2RWRGdGYU9XQlhpWGRDREU3VjcxR2cxZkJUNllCaVd6ZFluYTR3?=
 =?utf-8?B?R21iVVNVTkJadVJxSnZhb0d4RWFoa3dVbG5iaCt4VVFNR1FiR3R4TEtmVURY?=
 =?utf-8?B?M0dTSEw5Mythb3VSTWNFbTErMmJ3ejVjMlN0b1IvT3RxSlhCQTRJZVA4NkVU?=
 =?utf-8?B?MlNnWjBzUmhLSVFyaXpxUFhBUUZNQmd6RGN5Q3crNzgrejFST2lES0w4SlFn?=
 =?utf-8?B?VVlqVTNyR2hwT3NpMDI2RllnT2NFZkw0N2dLeTZqZkhmdlZHYmRMMFIvOGgv?=
 =?utf-8?B?OGpFZ1FtWVhKa2F3SzZFMTBLRDFpeUdBc1JzcmsrNlJ4ZWE4N0JyeGtLR1ZV?=
 =?utf-8?B?VTlqTDZrbVZlbm9YVUV1MDRjTnBSbW9ibEhLemtIYSt6NitHc2dQSXFXWE1M?=
 =?utf-8?B?bnd1SGVuc2tBK3hVbWNHTVNMQ0NTREJrb2M3dkJ1bUFpUzZCU3BxWFJidUh1?=
 =?utf-8?B?cE95VWNwVGpFKzBWbjJuVWN3MWNZd0U0eUhTOWk0bDB4UEZOQm9VaU1ocWtw?=
 =?utf-8?B?YTFuekY3Ri80TVhoc0hWQ1VkaEN1Ty9OTE5YZi8xUlV3bWx3U0NkaU9pOFRt?=
 =?utf-8?B?akp6blhqSGc1akNRRHVPbHo5L0wvb01TUmlCMUI2eWxlQVByWjJEVkFvcG9o?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc55099-cd10-4f50-6ca7-08daed8f657e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 13:35:36.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+I1qi5BVrwLcHrVUdGIYA+BN09ShO0Bo76Xpz9e9fHpg2PHdzgrDZj6s7UisAsN3ViAd5/czGdwku0euYA6GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 1/3/23 12:01, Alexander Stein wrote:
> Hi,
> 
> Am Dienstag, 3. Januar 2023, 11:55:34 CET schrieb Xavier Roumegue (OSS):
>> From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>
>> In case the IRQ allocation returns an error in dw100_probe(), the pm
>> runtime is not disabled before to return.
>>
>> Add the missing unwind goto on the error handling path of the IRQ
>> allocation request.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>>   drivers/media/platform/nxp/dw100/dw100.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
>> b/drivers/media/platform/nxp/dw100/dw100.c index f6d48c36f386..189d60cd5ed1
>> 100644
>> --- a/drivers/media/platform/nxp/dw100/dw100.c
>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
>> @@ -1571,7 +1571,7 @@ static int dw100_probe(struct platform_device *pdev)
>>   			       dev_name(&pdev->dev), dw_dev);
>>   	if (ret < 0) {
>>   		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>> -		return ret;
>> +		goto err_pm;
>>   	}
>>
>>   	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
> 
> Doesn't it make more sense to request/allocate the IRQ (and other resources)
> before enabling runtime PM?
I would say this does as much sense as the other way around, as soon as 
something wrong happens, you have to restore things as it was prior to enter 
your routine. The most optimal function call ordering should depend on the 
failing occurrence likelihood of each individual function.
On the probe path, I assume none of the functions are expected to fail.
But I understand one could argue differently.

So for the time being, this oneliner patch addresses the issue reported by the 
robot.

Regards,
  Xavier

> 
> Best regards,
> Alexander
> 
> 
> 

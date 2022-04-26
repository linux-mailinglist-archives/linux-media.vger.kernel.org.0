Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B598950FA51
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241345AbiDZKZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 06:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348831AbiDZKX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:23:27 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290121.outbound.protection.outlook.com [40.107.129.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AF228E08
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 02:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLWcY9KlOJXdHNYHV0BpilKILarwiSn65eghBLhzqwJIu89omPOa3Boll3IbC8ISsbXtd1gn6GehUQXqZbn2P7Meu0ZddpIXJNMnsp9/b8HF3A8drwB7u0ipjrL6vFzsvfOhfOozQU/wBLVScPTBifl3chRKtqGxxPys9ValBU1VmA0uJFkGxTUTm0HnrerEIqul3zBo6vz9nA1MLFuHcwWHG+6+sVDD/3PEgFT2JKb4YEzXeK/ND6sg9ipdlNxAIu7rIH6/UGuPP5bJ7ouORgQgv9cPvDt4eF0grcAyCF/DJOF7vIOlruyxk43XPCvAeUkbTNnqt53CB0BWnL82OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG9dWjxWGHmY8wyi87ZLQ18FBjUJUANxctETO3EUfsc=;
 b=SY4GqBQbmaDA61RCs/p9VHi9NgRDMq7R4itiHq1TYnmif6uE/WiBZps/Gp3y56+OyZlrsMscamKUFrM221osJs30xTUQ9EUiShUsRvGMIYGd9ZaJbFCzOHfsC7h3l17QaWsL3ZeEFoGfVLjccbqzpLx18c2lhQzUl39NDVPbB5pNNKH/I/Uj5PM2TB50Oun/mfoxSWrlHJDz+B1Ya0FP/BH45FybpdkCHlvK54oLxhaMYl7Ht6Kd9rwuhNfWbQazuaVdC3Q3gKvK8gy9bE3toBWlCn1BILtfeORZmbuS+RMrXJvjgKycOlVA+QYFeAmOF2TRwyvkhK2il8FSvcKe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG9dWjxWGHmY8wyi87ZLQ18FBjUJUANxctETO3EUfsc=;
 b=LBdzU+479Uy2/RpbwTgz1Vafzu2jeCU941Y5sjPUQuknM/cRlvIWyCVm3aD6WMl8RKjYYQaZNIxlBoyuwv8sr35zOrIxN/4bSyu91U07396jttrKedD1JbVX61+b+csgbCEBRvoju+mB8bkh7A9lctEfjr7YhCpFiOj4iMaimfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SLXP216MB1050.KORP216.PROD.OUTLOOK.COM (2603:1096:101:9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Tue, 26 Apr 2022 09:54:12 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:54:12 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH v7 0/6] staging: media: wave5: add wave5 codec driver
Date:   Tue, 26 Apr 2022 18:53:15 +0900
Message-Id: <9b1cece1-98b3-7126-1f05-d010ea2b098e@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <075dc19b-d7f5-3939-f736-766ed0aaad84@xs4all.nl>
References: <075dc19b-d7f5-3939-f736-766ed0aaad84@xs4all.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:100:55::32) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae208eca-4581-4b6d-9b94-08da276ab722
X-MS-TrafficTypeDiagnostic: SLXP216MB1050:EE_
X-Microsoft-Antispam-PRVS: <SLXP216MB105080EC911112FCED373A1EFBFB9@SLXP216MB1050.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8ZkKBsnG/1zg0mlvBSwEWfiHtadUQHQvzGQwT8rj+eezdg5xnqYPULj6/Jd786+zFgKjmx1ajyH4ZsiFtu7S5p8+rJxQLtr5//RVAOZtCVy+ord1dh/dgRIjqh4lVHvOUKsDqBN3Y34CFungXGw8CFAw1x2eqIsf4t0rNvx7An96VkUi+t/yC6aSekXoFyQELLm/tpg2PUzht3EfYW1AO1eJRzQxr/8XKu9pvEj0pnAbhPsSWzrBF/Fy3O1S5tv3WF6742y6S6E8bFAUv+fPkOwITL9X8/cqyVWJfTWDG7rlC2V8chlPT0tKHkqS4yA7wZlf/2zoz1/mErYBxAEWhxYiDR8MXwMpX4GWRqZ047OLBBamNhZr0w94BX0DkCxGx9WBl4EOcWZtx3/j4a0YunaO/TP2+UjpWysQryQPapHyIe4Bv6bxLp9Qs/5YbORawHQBYV6/BBS1Ue/FXhkxAcwxMkB76Uvta8OXCJacMiksKhoWtlQwIOl5Sf9SaM6FtnB4IS4HdCy61XD6+RMCni5ockisEww1Z+4DIh33mGXUImJNtxDqcD76etDQ0YdOI4dUJf1cOO1DoXu7QHVkXZt5SIo3Tn70FW+ilzYIN17lmPij1p/F1+tMpk929htHgA1+I2cMZDihjutXzD7i0f3EsKf2ghMVl+/KLzNYLQ10mxFJ1JMwOtwr2sIjl5yX8gxwONU5zClL0r65dg7x0QN78GfBy1JherQnCKW64K1/SVZGWUcJukAb//qaHMiOzGWQpONi1GoUnDJUx/vpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(376002)(39850400004)(366004)(346002)(136003)(396003)(6862004)(508600001)(6486002)(316002)(8676002)(66556008)(66476007)(31696002)(86362001)(37006003)(38100700002)(66946007)(38350700002)(6200100001)(6506007)(5660300002)(52116002)(2906002)(53546011)(36756003)(30864003)(31686004)(44832011)(83380400001)(26005)(6512007)(2616005)(186003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlhNOXdTdXdVdjhaTGJRbUJwL0RRRmRKb0UyMEkvMGovUWJ4QkJNaHNOcUVR?=
 =?utf-8?B?T3Q0RU4vNk1LaEpndGxWNCtNOEI5bzVMQlB3TnlkUW8vb0FweFBLdUc1V3BE?=
 =?utf-8?B?WThGaHlES1ZJVHRvL1o5UCtzelFaNlFNS2JCNEp6QjNXVnFCMXF6dU9oNVVB?=
 =?utf-8?B?TXJ4MTZ3bjRqUXRCNHd3cXl2QUFvYzdETk9JVmN1c1RueFpMRkNTb2NYbXB4?=
 =?utf-8?B?UVRRcG54L0l2ZGV4Mk1JRTVjOERTd3B2UFRlVmhjMnVYcUFxMVozS0VkS1hq?=
 =?utf-8?B?VTB5bTdoejB3RGhYaVh0a3dtcXZBTWlTWFZySGtrWGRqWGN0OThqT1h0L2Nj?=
 =?utf-8?B?MTlYZlM3N0c5UlpzME0yYlBGZWRWVHk0dElkQjEvQmNOd0NKZ0ZZZUYxZGI3?=
 =?utf-8?B?UDNDTEJsaEVKZ2hjYkdKMXZPT1Z4OEdjZ3hXU2xVbHVpTmNjaXcyUWE1SUY4?=
 =?utf-8?B?bE4yWFJTdStmT2xmb0dGZU9DMWtWVHB4QXJPN2NtMzEzV2R1ejE4SzdmVXVT?=
 =?utf-8?B?R3l5Q3UybWlDZ3A5ZitGWkk5dXQrV1d5cmx4bDZaNFdyVzVWSnVWRUd2K0s5?=
 =?utf-8?B?Z3ZHeCtiMzBSQnBsRWNibDhleWNqOVB6ZmVLUkppZ2wzM0tpczhBZUdlV3BU?=
 =?utf-8?B?OUY2TmNHYWVJM3YyVDhWSU1QMTNtSW9TZlMwUWpRZ2wxYVBYblhYZ0NrVWVo?=
 =?utf-8?B?d2NhN0pybzRTNng0R1I1N1Q2ZytUdFZFRnBsSWNmeFFLWFI0VXlpaExrOVpL?=
 =?utf-8?B?ZTdRUDhWZGphd0ZxNnBmaHpuNGE0bGIxVEYvRFRCTTZJeU4vNjFmMmprcHVS?=
 =?utf-8?B?NUQ1TDZYZEZSNTlTQlowY1VOZzZ5WXFacEVScU9LZDFwdnhKYXJmd2lnak1r?=
 =?utf-8?B?VXVISUs5cnJHZEIwc1NQcW9rQ0Z0amtMeGN0SzlJbGdnMlFnT1FPQk1va2Fx?=
 =?utf-8?B?N1UrUm9TU1pLM3Q0K2hDaE1Wb2xwVWEzcy9ZZnFuLzBoUThTSDBvN3d3R3U4?=
 =?utf-8?B?UUh2RnBZNjNhZ0p5czk0MmdGampCNm1lY1VPSmo5K3V0ZWdoRnpCRGlzMWRM?=
 =?utf-8?B?cFNkVjRQQkJGRk8zOExLWmFGVEUxc3hQWjJ4ZWppZ0IxOW1ZaU9YQWdiMnhB?=
 =?utf-8?B?alJBTHZxT1hTbHFBbEtPWHhqZlhqRWx2STFmak90T1VOM3VNNFFGWlNPSW9O?=
 =?utf-8?B?bnRDUEhsNkI5Y0tYYWxYR1pGcnpQK3BmNElaRDRmcmllM1ZLbHJSSHl6VHY5?=
 =?utf-8?B?T2YxelNtdGY2RVNiMVhTaVBPUkQvdFdEM05TQkt2dkg4cUNjOFdya0ZUQy9h?=
 =?utf-8?B?ZU9zRGFYRDB4VWxWbXliVTQvNnVyU216Uk9lM2w1dlBSQlhKVWU2bzlXd0Iw?=
 =?utf-8?B?WkF1emNpV3F2c2pMK1JXOFJHczlWSExzLzZnTnRwdHdueHpNN0MwNDlNK214?=
 =?utf-8?B?cXpCcE9NZnl1QUhOSUwxejVleENqRG85SEdnNm5yVDg3S1o5S2lkYzhoUFk4?=
 =?utf-8?B?dk9zYWRTYlFpTTRZL1FzR05WamYvV2x5SUM1QmFvNUdGc3l6MWRDbVJ0UWhs?=
 =?utf-8?B?cDZPaStQK3E2OC9VZkN6Y0xJSFFmZ1FFTW1QT2Vqb0ZDN2hHY1FKaXRRM21s?=
 =?utf-8?B?cjVzbWpiQzRZMENuYmZWN1pvaXBjTThqTXpRMjlvVVBodUJZOWRzemkwais0?=
 =?utf-8?B?K3VzNGFJUi84ckMyakhvUzdCWDNBN1NCSnFucW9vV1h5QVFUVnpyc0d2aHBZ?=
 =?utf-8?B?dDIwN2lScnp5R2JJeUl3eXRSRXEzc0E4OXBaMDFVbUpQUVJZV25qSTNaMlhl?=
 =?utf-8?B?YXRLSUpkbGlUV1llZDdFaUx5R01XTktZVnc5TGZ0VXFXblpNamc5SFRmeGxV?=
 =?utf-8?B?MzhvOTA0TkdWdnJKL254ZWZjS2ZGY2twRHI1dHRNaS9acjlyMFNGRDJIZE1I?=
 =?utf-8?B?bHlXamVmVnN0V0NTckJsNSszYzI1cHZEMjRVKzdMRWFxQTVXd1hoUkJLdkdD?=
 =?utf-8?B?TDhUZE1NMmRERWQ4cHN1cFJCcEZMbzNZUFd1bVc0dUYxS3BWRHhOZXN4cVUr?=
 =?utf-8?B?ZGRCUTdLVitWTGJXdmJCUXdWQkZma0E1bjdWdURXWWo4Uy9OQ0Q4d1ltVStP?=
 =?utf-8?B?ejl4VmNTWmM3YU16WXRPdzRKRWZDeG8wbXhPOCtmWWRaMks3K0t1aDBvLytx?=
 =?utf-8?B?OTNVbjdYYkZ4dGg0cXBEamVIUStMelNobnNGZW5IeFQvMnFvK0hTb2FGWWw4?=
 =?utf-8?B?Zis4SHBDK1g1WUdPTzJBcHRvK2I2aVppeXBDRGF2WGRpUCtESHV6d3BudzI2?=
 =?utf-8?B?NEpqb0g3bFVrbHpueEtwSTd5M1FEM1dGdUVTVCtlQjJvNllObGJkR0JqSmNX?=
 =?utf-8?Q?U7MjXZwgKMHPvLCA=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae208eca-4581-4b6d-9b94-08da276ab722
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:54:12.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpArOUfiQJikGGtkxgroMm2onVooLFphhF+/rO99Ws268U9t/TozZkmaamOmj/vmSz/EnGD+ApRpXf5gp0vTxxqklSv+Lf+Iy1tmooxa4RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB1050
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Hans,

> On 25/04/2022 12:16, Nas Chung wrote:
>> The wave5 codec is a stateful encoder/decoder.
>> It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC. Etc..
>> But current test report is based on J721S2 SoC.
>>
>> The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.
>>
>> This driver has so far been tested on J721S2 EVM board and pre-silicon FPGA.
>>
>> Testing on J721S2 EVM board shows it working fine both decoder and encoder.
>> The driver is successfully working with gstreamer v4l2 good-plugin without any modification.
>>
>> Testing on FPGA also shows it working fine, though the FPGA uses polled interrupts and copied buffers between the host and it's on board RAM.
>>
>> The wave5 driver will be updated to support various EXT_CTRL encoder interface.
> Please note that for some unknown reason neither v6 nor v7 ever reached the
> linux-media mailinglist. Can you try to repost, this time just to the mailinglist
> and with a CC to me?
>
> I have seen this problem before but it was never clear why linux-media would
> reject it. If you have an alternative email address you can email from, then
> you can try that as well.

I think my email client have a problem.
I will change the email client and repost it with the latest version test report.
Should i rename it for PATCH V8?

Thanks.
Nas.

>
>> v4l2-compliance tests from J721S2:
>>
>> # v4l2-compliance -d0
>> v4l2-compliance SHA: not available, 64 bits
> You must compile v4l2-compliance from the v4l-utils git repo. You can tell because
> the SHA will be shown. That way I can be certain you tested with the latest
> v4l2-compliance.
>
>> Compliance test for vpu-dec device /dev/video0:
>>
>> Driver Info:
>>         Driver name      : vpu-dec
>>         Card type        : vpu-dec
>>         Bus info         : platform:vpu-dec
>>         Driver version   : 5.10.100
> 5.10 is really quite old, is it possible to test with a newer kernel?
>
> Regards,
>
>	Hans
>
>>         Capabilities     : 0x84204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps      : 0x04204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>         Detected Stateful Decoder
>>
>> Required ioctls:
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second /dev/video0 open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>         test VIDIOC_QUERYCTRL: OK
>>         test VIDIOC_G/S_CTRL: OK
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>         Standard Controls: 2 Private Controls: 1
>>
>> Format ioctls:
>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>         test VIDIOC_G_FMT: OK
>>         test VIDIOC_TRY_FMT: OK
>>         test VIDIOC_S_FMT: OK
>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>         test Cropping: OK (Not Supported)
>>         test Composing: OK
>>         test Scaling: OK
>>
>> Codec ioctls:
>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>         test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK (Not Supported)
>>
>> Total for vpu-dec device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
>>
>> # v4l2-compliance -d1
>> v4l2-compliance SHA: not available, 64 bits
>>
>> Compliance test for vpu-enc device /dev/video1:
>>
>> Driver Info:
>>         Driver name      : vpu-enc
>>         Card type        : vpu-enc
>>         Bus info         : platform:vpu-enc
>>         Driver version   : 5.10.100
>>         Capabilities     : 0x84204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps      : 0x04204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>         Detected Stateful Encoder
>>
>> Required ioctls:
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second /dev/video1 open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>         test VIDIOC_QUERYCTRL: OK
>>         test VIDIOC_G/S_CTRL: OK
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>         Standard Controls: 15 Private Controls: 0
>>
>> Format ioctls:
>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>                 warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(1320): S_PARM is supported for buftype 2, but not for ENUM_FRAMEINTERVALS
>>                 warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(1320): S_PARM is supported for buftype 10, but not for ENUM_FRAMEINTERVALS
>>         test VIDIOC_G/S_PARM: OK
>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>         test VIDIOC_G_FMT: OK
>>         test VIDIOC_TRY_FMT: OK
>>         test VIDIOC_S_FMT: OK
>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>         test Cropping: OK
>>         test Composing: OK (Not Supported)
>>         test Scaling: OK
>>
>> Codec ioctls:
>>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK (Not Supported)
>>
>> Total for vpu-enc device /dev/video1: 44, Succeeded: 44, Failed: 0, Warnings: 2
>>
>> changes since v6:
>>
>> * update TODO file
>> * get sram info from device tree
>>
>> changes since v5:
>>
>> * support NV12/NV21 pixelformat for encoder and decoder
>> * handle adnormal exit and EOS
>>
>> changes since v4:
>>
>> * refactor functions in wave5-hw and fix bug reported by Daniel Palmer
>> * rename functions and variables to better names
>> * change variable types such as replacing s32 with u32 and int with bool as appropriate
>>
>> changes since v3:
>>
>> * Fixing all issues commented by Dan Carpenter
>> * Change file names to have wave5- prefix
>> * In wave5_vpu_probe, enable the clocks before reading registers, as commented from Daniel Palmer
>> * Add more to the TODO list,
>>
>> changes since v2:
>>
>> Main fixes includes:
>> * change the yaml and dirver code to support up to 4 clks (instead of one)
>> * fix Kconfig format
>> * remove unneeded cast,
>> * change var types
>> * change var names, func names
>> * checkpatch fixes
>>
>> changes since v1:
>>
>> Fix chanes due to comments from Ezequiel and Dan Carpenter. Main fixes inclueds:
>> * move all files to one dir 'wave5'
>> * replace private error codes with standart error codes
>> * fix extra spaces
>> * various checkpatch fixes
>> * replace private 'DPRINTK' macro with standart 'dev_err/dbg ..'
>> * fix error handling
>> * add more possible fixes to the TODO file
>>
>>
>> Dafna Hirschfeld (1):
>>   staging: media: wave5: Add the vdi layer
>>
>> Nas Chung (3):
>>   staging: media: wave5: Add vpuapi layer
>>   staging: media: wave5: Add the v4l2 layer
>>   staging: media: wave5: Add TODO file
>>
>> Robert Beckett (2):
>>   dt-bindings: media: staging: wave5: add yaml devicetree bindings
>>   media: wave5: Add wave5 driver to maintainers file
>>
>>  .../bindings/staging/media/cnm,wave.yaml      |   73 +
>>  MAINTAINERS                                   |    9 +
>>  drivers/staging/media/Kconfig                 |    2 +
>>  drivers/staging/media/Makefile                |    1 +
>>  drivers/staging/media/wave5/Kconfig           |   12 +
>>  drivers/staging/media/wave5/Makefile          |   10 +
>>  drivers/staging/media/wave5/TODO              |   34 +
>>  drivers/staging/media/wave5/wave5-hw.c        | 3405 +++++++++++++++++
>>  drivers/staging/media/wave5/wave5-regdefine.h |  655 ++++
>>  drivers/staging/media/wave5/wave5-vdi.c       |  260 ++
>>  drivers/staging/media/wave5/wave5-vdi.h       |   81 +
>>  drivers/staging/media/wave5/wave5-vpu-dec.c   | 1385 +++++++
>>  drivers/staging/media/wave5/wave5-vpu-enc.c   | 1532 ++++++++
>>  drivers/staging/media/wave5/wave5-vpu.c       |  381 ++
>>  drivers/staging/media/wave5/wave5-vpu.h       |   73 +
>>  drivers/staging/media/wave5/wave5-vpuapi.c    | 1049 +++++
>>  drivers/staging/media/wave5/wave5-vpuapi.h    | 1144 ++++++
>>  drivers/staging/media/wave5/wave5-vpuconfig.h |   91 +
>>  drivers/staging/media/wave5/wave5-vpuerror.h  |  455 +++
>>  drivers/staging/media/wave5/wave5.h           |   82 +
>>  20 files changed, 10734 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
>>  create mode 100644 drivers/staging/media/wave5/Kconfig
>>  create mode 100644 drivers/staging/media/wave5/Makefile
>>  create mode 100644 drivers/staging/media/wave5/TODO
>>  create mode 100644 drivers/staging/media/wave5/wave5-hw.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-regdefine.h
>>  create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-vdi.h
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu.h
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.c
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.h
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuconfig.h
>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuerror.h
>>  create mode 100644 drivers/staging/media/wave5/wave5.h

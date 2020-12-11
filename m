Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219C12D7131
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 09:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405461AbgLKIEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 03:04:44 -0500
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com ([40.107.244.41]:33567
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405447AbgLKIE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 03:04:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIm8ZpsIYjla3KsY3lPfVLG+o9Fh5sHAnpNi1+Z3Euty62WfJSZzB4+J0rWlCfWg4v6R/VmFnjyVrinj0nKzJKclGcXSGmuKOJ9J9PW0+EWmSmBgea8SgXPmpaTD5xyrXXthBQMZrwHcMcAin417+3DI3rcA6Lo2SkdFUrvSTx42/J5FM+tMBEnKpOTZ7gAlOsjBp+Hx8SuB22Ee/ZfW2Lk+Wucr6LBtGF/OmS13F+J8wKhK/aKhJqmK/YctdWAKmFYcidoVhEYWGP5aM3HFvX3MF6ktEtvgWSNetno2Zo4wu3Q/nf7ETGfJA0M/e8HTXRy42LrhZU97UWv3dbJfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lER1/WoGovLjy84KcxRCj6bJ7dI2TxCZQ93ok2ZRWU=;
 b=VpziYa7j+1ZOM/zgsvXMrUBDNsHn9yDt5GcBv2gNyMpfuxBfumui+5ogq4GQ6USjnO1ORt8Er8GuQg4Bi96xQ0Z1Hl5srE5r0nbLMXO/wca9Ye6pcec6lc5oqRGuBUNPVwybe531wdajxPGHxkmBnxwcjAYhmzxC9CXgndbJon9v3627V4Fz8T+IPz4hCMlbZv7Mmz0Rm7dWNNE5m04t50hFxSiBWBgCh6zt1XQV8sBxmiIvdbSPmJ6CgLXAhUTFX94VESWeoyH1dZp8J1lsj7/nTscQ/0sKfFkAMIXrJf2xJHgKKvNciatIr6ZpUsKwaTmI0hQ1FnhnbAuEr7c54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lER1/WoGovLjy84KcxRCj6bJ7dI2TxCZQ93ok2ZRWU=;
 b=yrIFXSLW2o6bf7t4qsib/gnrxhwMpqoMS1GdbGte+v48dtWbP02rwBLKon36W3fLvL9l1rzs10Uhp/XjRv+To9/EyVVQFQO+L2rZlgQJVE4LIbP/ESUvksr7acJLzOSrOALGFG2mdCuPC6y8s6L7Jvtf4dbMPnW8koMPwY3f2fs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 08:03:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 08:03:36 +0000
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Android Kernel Team <kernel-team@android.com>,
        linux-media@vger.kernel.org
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com> <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local> <X9H+3AP1q39aMxeb@kroah.com>
 <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
 <CA+wgaPPtoz_JSAwsVVpFGLrcrO8-tAGD+gdrsWmBA3jpidigzQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e854d168-9299-7326-743e-874882d8073f@amd.com>
Date:   Fri, 11 Dec 2020 09:03:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CA+wgaPPtoz_JSAwsVVpFGLrcrO8-tAGD+gdrsWmBA3jpidigzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 08:03:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42aceb2b-c9dc-4795-7fda-08d89dab42ed
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946256B3696ABA6A13FF29683CA0@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2qZXPyTanI4b/u6ZRTv8/tFZ6wt8uqQG40DMKIFkClkzKBuLDqqt1gVkrq1U/zVwWx8doYOqFqtvx4EICXwgRonkXxUsVDxFfSVPECigHshOs8avkquKVesXNJKeIREqC3F5CYosQZHuNq0jEMwrQmjwBuLp5fIcQzy7NUhvtdIQX6eez9qoGVfoHC4gaper6b03g5vkN3Mz9M1DCrL6Ha9Jm2cq21kh6j23MWZY2XEQd2iKGO+k6nG7NdyQyfqUIhiGfN2icQCfYUnP7OiXai26DITtPm+39yBRvmFGYdGsakgxgrViG1E3odxJrC4/v6A2NyzN/3aZm2c4r6ocMY67JeJ0IPK7w6FNsHkud91ktX9uGk6V/64LK0eIfgfPBsZPk8mO2xdnn9lTXnxIOsipwz49Jbmc5pRBnBIrO8vLPj+TnKAA2wCPnSuMEMU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(31696002)(8936002)(16526019)(186003)(6666004)(34490700003)(54906003)(66574015)(66476007)(31686004)(86362001)(2616005)(66556008)(36756003)(8676002)(52116002)(508600001)(2906002)(66946007)(5660300002)(53546011)(6916009)(6486002)(83380400001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlhzaHdYRnBqY1gwNU5LTW5Gd2NBRUZEZ014MHdqWmVPbjVOTEt4aXpVVSty?=
 =?utf-8?B?M0dqZnNTSjJKbHk0M01mRStkWk8wVWthRS9RM01sOHFmUWVMYmEzYUFWUEtK?=
 =?utf-8?B?SUd0bjBuYyttek5IYTF3b3BmbkhGdWJPU3dTTlJKUVhUVzhVdmFFOENHWE5z?=
 =?utf-8?B?WllFdmR4OUdxZ3g0NzFONmcrUVI3Q1grb0ZEVkRsU2JiaHNWRXVrOUU5K3dC?=
 =?utf-8?B?bG02aS9ZUGNGb1BMYmRONE1GeWVkR0JESjZkdU5iT2JTdkU5cnIwRit1Zjcr?=
 =?utf-8?B?aCtneTFvRFo5Yjg3YWoxaHVMWHpNblhVeEV2STI1cVkvVC9FWGhoTDJ0RGNh?=
 =?utf-8?B?ZDVveWNIYURRcGdjR0ltLzJOZXNSOUpDVUtVSURwaGRoL3k5VDlDeWkyNWNS?=
 =?utf-8?B?L1Z1TFBHOWpOTDU5SlNrc0Q1YmFJSDBtTzMzYkZmbVdLTHpwb3lOb2c0Vzdx?=
 =?utf-8?B?T2JlOUkvTGJCaTR0cHRvMzlTQ3J6UGQ5bmZjTjM4TExCQVZsZHVzc2EyZGsr?=
 =?utf-8?B?Y0VQY1IrQVBsTlB1cVdtUWZBdVZkT0Nqdk5rZmFLbUpHTnJOaUhXcy9ZT1F5?=
 =?utf-8?B?UGgybjBtbWMyYWF6aWVuSXVoWGM1cEg5Z0dycjRPWDdlcVNjdXJaNjZ1cjlM?=
 =?utf-8?B?NHlGYlI3RmhYQXMyZ1ZQZHhRNm9PL3FhMGgra3R2UjNkSnBYenZNaHFiNTF5?=
 =?utf-8?B?bXFZWnBrdXpUWmhCUHdBQzJNQ280ekw0RnJWOFlISHNkR3JBNDJZMVB3MzI1?=
 =?utf-8?B?Ly9uYnBka25XTGJDbFFHMXlGeVYxQkx3TTJMY0hmaHJBaURVMEdMdGl5WXd4?=
 =?utf-8?B?cC9qYytYT3RBcGhtU3dSMitlVzJvVnpUMGg4bG9vR1RGZmpXeE5DSnZsK3dO?=
 =?utf-8?B?VmhHUytoWHJEUnpZOWpPcEhyMmhHRzRqT29aZCtVSlN0amNONWpDdkhBSG41?=
 =?utf-8?B?QllqWmtBb2U1SUdkRnBFeW5tWjVZY2Rpb2RPOEdMbERYb09ZSmpFWndFdWor?=
 =?utf-8?B?S20ySXRhdFVhMzdrUDk2NTJjUVpZYnZyQ0NYODJHUVU2ZGIydFllRFJsbnVB?=
 =?utf-8?B?aUZ6eGNkYTV5UmNXd0gwTlMzOTFxT3hmZUZJeHp5OE5aTm53ZEdSbTd2d0Js?=
 =?utf-8?B?cnEvOFByV1VwUXF4TmpCSmd3SnlwUVBhV2tmb0w4V3RLSnF1NG5YazFqcTVF?=
 =?utf-8?B?bkNXamdpMG55dXpqbzB2VFNyYkRQUm80VnJxUklHZHdGTWNGZkp5a09nZnlF?=
 =?utf-8?B?ekFudDFSTkw2eDF5SDF1Ky8vbEVGU0VKSTRiam5KT2MraEQwYkIxYjZMcG5Y?=
 =?utf-8?B?bmhUbXlRb29WTEl1U3AzTVZxYTA1bUxvNStlWHZxSVVnUU1DeGIvTTBuaWRm?=
 =?utf-8?B?cUF0SFd1VHhURjE3NFY5SUVROE1YcmR3ODlucERHME8xdUdQcDdEOGV2UGRr?=
 =?utf-8?Q?6wH1JQxO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 08:03:35.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 42aceb2b-c9dc-4795-7fda-08d89dab42ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD286cTrPdmpcVDHTBR9Gi2wuuR07aEsaFtWGkCDgywgL7N6riw5Nak7vGczkxTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 10.12.20 um 23:41 schrieb Hridya Valsaraju:
> Thanks again for the reviews!
>
> On Thu, Dec 10, 2020 at 3:03 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.12.20 um 11:56 schrieb Greg KH:
>>> On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
>>>> On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
>>>>> On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian König wrote:
>>>>>> In general a good idea, but I have a few concern/comments here.
>>>>>>
>>>>>> Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
>>>>>>> This patch allows statistics to be enabled for each DMA-BUF in
>>>>>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>>>>>>>
>>>>>>> The following stats will be exposed by the interface:
>>>>>>>
>>>>>>> /sys/kernel/dmabuf/<inode_number>/exporter_name
>>>>>>> /sys/kernel/dmabuf/<inode_number>/size
>>>>>>> /sys/kernel/dmabuf/<inode_number>/dev_map_info
>>>>>>>
>>>>>>> The inode_number is unique for each DMA-BUF and was added earlier [1]
>>>>>>> in order to allow userspace to track DMA-BUF usage across different
>>>>>>> processes.
>>>>>>>
>>>>>>> Currently, this information is exposed in
>>>>>>> /sys/kernel/debug/dma_buf/bufinfo.
>>>>>>> However, since debugfs is considered unsafe to be mounted in production,
>>>>>>> it is being duplicated in sysfs.
>>>>>> Mhm, this makes it part of the UAPI. What is the justification for this?
>>>>>>
>>>>>> In other words do we really need those debug information in a production
>>>>>> environment?
>>>>> Production environments seem to want to know who is using up memory :)
>>>> This only shows shared memory, so it does smell a lot like $specific_issue
>>>> and we're designing a narrow solution for that and then have to carry it
>>>> forever.
>>> I think the "issue" is that this was a feature from ion that people
>>> "missed" in the dmabuf move.  Taking away the ability to see what kind
>>> of allocations were being made didn't make a lot of debugging tools
>>> happy :(
>> Yeah, that is certainly a very valid concern.
>>
>>> But Hridya knows more, she's been dealing with the transition for a long
>>> time now.
> Currently, telemetry tools capture this information(along with other
> memory metrics) periodically as well as on important events like a
> foreground app kill (which might have been triggered by an LMK). We
> would also like to get a snapshot of the system memory usage on other
> events such as OOM kills and ANRs.

That userspace tools are going to use those files directly is the 
justification you need for the stable UAPI provided by sysfs.

Otherwise debugfs would be the way to go even when that is often disabled.

Please change the commit message to reflect that.

>>>> E.g. why is the list of attachments not a sysfs link? That's how we
>>>> usually expose struct device * pointers in sysfs to userspace, not as a
>>>> list of things.
>>> These aren't struct devices, so I don't understand the objection here.
>>> Where else could these go in sysfs?
>> Sure they are! Just take a look at an attachment:
>>
>> struct dma_buf_attachment {
>>            struct dma_buf *dmabuf;
>>            struct device *dev;
>>
>> This is the struct device which is importing the buffer and the patch in
>> discussion is just printing the name of this device into sysfs.
> I actually did not know that this is not ok to do. I will change it in
> the next version of the patch to be sysfs links instead.

Thanks, you need to restructure this patch a bit. But I agree with 
Daniel that links to the devices which are attached are more appropriate.

I'm just not sure how we want to represent the map count for each 
attachment then, probably best to have that as separate file as well.

Regards,
Christian.

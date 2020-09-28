Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C4C27AC9C
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 13:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgI1LW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 07:22:26 -0400
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:54752
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726477AbgI1LWZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 07:22:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCjLUCAA8XVyDL2KBJHmEi1Zy/SgpeK1LtIXigePlKkqafb6qaZvlR2jMFaw8uElsDnOXJsGimsf8GbF+NfMjb0UYo4SPWGCGumYZ6GGkmBjjpdC2+ie4ANOXZkVCkPcFBnI0Q7/m0TMt4MvJ00o/88irizYYZF54nUx/2KJnPHfMYv38IsinC6ta6a/S49xKJldDOCjuBUMokVDi/4EogPr6XXgnFLFz7WJmIV74VjHYzKxpBYlwWHFBUwxjYRuwsG57xbPWRIGFZXbSDvC7RhFdE87YzkBZkLcFPcrINTCWAswea4m7B/3ngFSOQQCcfpEvEOyc/t2CRRXZqN4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8W5ThzNGSBL01HXMBRedFUTKVe6ilyPQyyYKe2xKk=;
 b=fP6As9m0yb5e9Y30h+Zd9gR9v3SMlyoFx7Gk5RNTALfkb15TDlVMPWL6Yb+D4lkqs/tdEHBMPTMoKdWwvNTW+a6V9ppQo9P/TX0Mp5Vzo4cGY8EPShQNt0KtqT+WzbnCUifqzjcvN9JtQiqSAnab3hfTH0sj1wFbCCcyfkKpeWiszizRqIciCboig7c8ds6s2PkSqLqJ1epKPyYNJK442QAReyp4bzzDPED3uWN6MbmaFLm+I7SoN7V85CS6cdKxSRldknukFuGXlcAIobIL/a+uQbytoTYhHooFjKKgKHJZVm5FLK8YNkqcq2rQMmZbBFmBMXUPBPKZWipPxm1iOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8W5ThzNGSBL01HXMBRedFUTKVe6ilyPQyyYKe2xKk=;
 b=j7JdjJsgyMBQJ0WwPDQ81i5UNk45tcg+b9r1HedEwEOELVLowSBXy30CWi3gYiourig4qSCsCANM1D/n0cMTHA4ASZ5LhxuAMqp/Qkr7pLx1DhE66b3ZkmIPss3Nax5xMbkAfBlKKpQOO//TC2mnF5rA/Hvdzsc1DPZWyWKG4vo=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Mon, 28 Sep
 2020 11:22:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 11:22:22 +0000
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-doc@vger.kernel.org, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        kraxel@redhat.com, afd@ti.com, m.szyprowski@samsung.com,
        arnd@arndb.de, corbet@lwn.net, jonathanh@nvidia.com,
        matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
        labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
        rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        lmark@codeaurora.org, tfiga@chromium.org,
        kyungmin.park@samsung.com, robin.murphy@arm.com
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
Date:   Mon, 28 Sep 2020 13:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend Transport; Mon, 28 Sep 2020 11:22:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 344bcca5-18b3-4dda-ed79-08d863a0c45f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB440857BCFC2C769A76568D5183350@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRUeFrkBXr0H/jOwBHqPHvishB50tqoIEUWeMVTO+hw02PbTm40K1M4nq7IWUIdSB5NWuAKDdulLk4b4Wm40EkIIpaQikrj99GeqTnCQAtumQPQ/pEGm7OEmdOo9vhMyqof7a2SRSr3nDRuX2xi+vdzI1OznvMKwLhjA925OTvJ0T5QfVDI/y+Ny0wQdOf+7zg3uvysQApS8zQ21Fl/0cjrcYJn/l43lUOuBzBi+W8HRpi8pFw+DaThqo08YgCKPJ+2Exnh+Bu2Fg4sOQEtFPZ8RXqepra2IK5fDdS07poduy/QUyHfaLV2xTA/axhcDbu52si9HTP8ra79pFRoxXPWhN352KsJI3LYeIit4w4p+gabNc1wgMGtc/HA+LhEtp6+nWrDQ/aM3uKBGKQobI+Mh5+ebBOOvoGxFaiCufSKeXAUacGx7783HFU0zhvZvXw4e6dqFWRD63pPObzgzCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6486002)(36756003)(4326008)(86362001)(8936002)(52116002)(478600001)(6666004)(966005)(31696002)(8676002)(83380400001)(2616005)(316002)(66574015)(66946007)(31686004)(66476007)(66556008)(110136005)(16526019)(5660300002)(186003)(2906002)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qGSPofKGJ256FYvsiC1t6pMhAyaJsKnwicKR9y7MycQ38js9z/WvHfjtSoem1bR+lbYjhGZ54CFlDmmF+FZ2j14c2vF9jZaZguOBdM2Z/SsFcU8jm7ej0mTMTFEDQRvWbMQa3QfMRvVe7teKChGXsv37QdrP5V9S8PPV2HJUh8qDzrGn0rXV6y91S0HBVRnZsunU3nPVv72h5G3icpPGPPaW/VpQR3gxMryIj2mCLomPSpK3uq0Wg2pbHichri5uZbueqhq9aKWvS/G0eEdACyRhJDPd/sqvvmIflMxPNQ2naC6AAlrm429TR2f7lAggFZzpXKp+uTL3/FlE44emuNCl/sfJOLGwcQvL6FYi6XG3V49y7yJ+QTNzU1jSlNRpaw+cttjHGbazjsDcW5lYPj4qGPE0srzzh0wFvFqMqHO9HK0NonbSSPUrZys+4NXYfF/Io35ztwRUq3MNlawNDRvf+xEazNqNdn4QUyMHtnHuyc45AopcfXJhiw7T71OP8jpR3d3dk8Ub3wUedrr6c3kkOKMBLZ+zBPE9fOTAalkJ8CH33zCuDLiaAKQ2yfTFl/9w6Q/nTKI3ozWwdBgNoniuLdjS+dYwowxgxT3Ji49zNg5AoEEaOhms6nGJbc9DB/sULA7BR3jCQQgrTWmuLtbxvYg1rH7cAimeZwTpzZspP9PrdyuGI3mbJ9cY6jOHprMu3hifcdy+hKwv3Stw9A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344bcca5-18b3-4dda-ed79-08d863a0c45f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 11:22:21.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUI07lNO1T0FbvSXW9b82g9qM23oBRcHqu8hT0hOvTAzGUGVEsS+FFwqw2fhcD0B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 28.09.20 um 09:37 schrieb Thomas Zimmermann:
> Hi
>
> Am 28.09.20 um 08:50 schrieb Christian König:
>> Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
>>> Hi Thomas.
>>>
>>>>> struct simap {
>>>>>          union {
>>>>>                  void __iomem *vaddr_iomem;
>>>>>                  void *vaddr;
>>>>>          };
>>>>>          bool is_iomem;
>>>>> };
>>>>>
>>>>> Where simap is a shorthand for system_iomem_map
>>>>> And it could al be stuffed into a include/linux/simap.h file.
>>>>>
>>>>> Not totally sold on the simap name - but wanted to come up with
>>>>> something.
>>>> Yes. Others, myself included, have suggested to use a name that does not
>>>> imply a connection to the dma-buf framework, but no one has come up with
>>>>    a good name.
>>>>
>>>> I strongly dislike simap, as it's entirely non-obvious what it does.
>>>> dma-buf-map is not actually wrong. The structures represents the mapping
>>>> of a dma-able buffer in most cases.
>>>>
>>>>> With this approach users do not have to pull in dma-buf to use it and
>>>>> users will not confuse that this is only for dma-buf usage.
>>>> There's no need to enable dma-buf. It's all in the header file without
>>>> dependencies on dma-buf. It's really just the name.
>>>>
>>>> But there's something else to take into account. The whole issue here is
>>>> that the buffer is disconnected from its originating driver, so we don't
>>>> know which kind of memory ops we have to use. Thinking about it, I
>>>> realized that no one else seemed to have this problem until now.
>>>> Otherwise there would be a solution already. So maybe the dma-buf
>>>> framework *is* the native use case for this data structure.
>>> We have at least:
>>> linux/fb.h:
>>>      union {
>>>          char __iomem *screen_base;      /* Virtual address */
>>>          char *screen_buffer;
>>>      };
>>>
>>> Which solve more or less the same problem.
> I thought this was for convenience. The important is_iomem bit is missing.
>
>> I also already noted that in TTM we have exactly the same problem and a
>> whole bunch of helpers to allow operations on those pointers.
> How do you call this within TTM?

ttm_bus_placement, but I really don't like that name.

>
> The data structure represents a pointer to either system or I/O memory,
> but not necessatrily device memory. It contains raw data. That would
> give something like
>
>    struct databuf_map
>    struct databuf_ptr
>    struct dbuf_map
>    struct dbuf_ptr
>
> My favorite would be dbuf_ptr. It's short and the API names would make
> sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an
> address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates
> that it's a single address; not an offset with length.

Puh, no idea. All of that doesn't sound like it 100% hits the underlying 
meaning of the structure.

Christian.

>
> Best regards
> Thomas
>
>> Christian.
>>
>>>   
>>>> Anyway, if a better name than dma-buf-map comes in, I'm willing to
>>>> rename the thing. Otherwise I intend to merge the patchset by the end of
>>>> the week.
>>> Well, the main thing is that I think this shoud be moved away from
>>> dma-buf. But if indeed dma-buf is the only relevant user in drm then
>>> I am totally fine with the current naming.
>>>
>>> One alternative named that popped up in my head: struct sys_io_map {}
>>> But again, if this is kept in dma-buf then I am fine with the current
>>> naming.
>>>
>>> In other words, if you continue to think this is mostly a dma-buf
>>> thing all three patches are:
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>
>>>      Sam
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678CF18CD1
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 17:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfEIPT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 11:19:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48706 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726251AbfEIPT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 11:19:58 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x49F67xG151125
        for <linux-media@vger.kernel.org>; Thu, 9 May 2019 11:19:56 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2scn2swgvy-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 11:19:56 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 9 May 2019 16:19:55 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
        by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 9 May 2019 16:19:51 +0100
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x49FJoJK62980116
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 May 2019 15:19:50 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A54396A05F;
        Thu,  9 May 2019 15:19:50 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2A1226A057;
        Thu,  9 May 2019 15:19:50 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu,  9 May 2019 15:19:50 +0000 (GMT)
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
 <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
 <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
 <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
 <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
 <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
 <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Thu, 9 May 2019 10:19:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050915-0036-0000-0000-00000AB735CA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011077; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01200874; UDB=6.00630128; IPR=6.00981764;
 MB=3.00026812; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-09 15:19:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050915-0037-0000-0000-00004BB8853D
Message-Id: <5a155296-b1a7-4120-3ead-1b0d21772f1a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090088
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/8/19 9:16 PM, Benjamin Herrenschmidt wrote:
> On Wed, 2019-05-08 at 18:19 -0700, Jae Hyun Yoo wrote:
>> I changed that from a bool because the maintainer of this code, Eddie
>> doesn't like adding of an additional flag. I'll change it back with
>> codes in the first submit:
>> https://www.spinics.net/lists/linux-media/msg148955.html
>>
>> Eddie,
>> Please let me know if you have any objection on that.


Thats fine with me. I merely thought it was more conventional to use 
flags rather than bools, but I may be mistaken.

Thanks!

Eddie


> Ok, so random flags ... ugh.
>
> Well, you can approach it either way. Have them all be bitops or all be
> bool.
>
> The tricky thing however is that if they are bitops you need to ensure
> that they are *all* manipulated under the same lock. If not you have to
> use the atomic bitops variants.
>
> The reason I don't like that is that experience shows that most uses of
> such atomic variants in drivers usually are failed attempts at papering
> over broken locking.
>
> If everything is covered by a lock, then using the non-atomic versions
> is more efficient, but so is using bool (optionally with :1 bitfield
> qualifiers to avoid wasting memory), which from a pure C language
> perspective I think is more expressive of what you are doing and more
> readable.
>
> Cheers,
> Ben.
>


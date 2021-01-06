Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3D2EBE98
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbhAFN05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:26:57 -0500
Received: from 9.mo4.mail-out.ovh.net ([46.105.40.176]:58617 "EHLO
        9.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbhAFN04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:26:56 -0500
X-Greylist: delayed 157737 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 08:26:55 EST
Received: from player773.ha.ovh.net (unknown [10.108.42.88])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 14FC725EFC6
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:38:10 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-215-46.w86-243.abo.wanadoo.fr [86.243.176.46])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player773.ha.ovh.net (Postfix) with ESMTPSA id C0F6319D498C6;
        Wed,  6 Jan 2021 08:38:01 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G00352f35390-87ca-435a-8d60-2ccb68778e48,
                    2877095AE5B00A1DD94A508FAF09BB9C3E952DE9) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.176.46
Subject: Re: imx6ull capture from OV5640
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
 <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
 <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com>
 <20210105150129.fresebmib75htyl5@arch-thunder.localdomain>
 <CAOMZO5D+GGM_QPc0=nWEYe=XV1EBgUS7ff+t+0aER-fg+a4PKA@mail.gmail.com>
 <20210105193248.hegbxct4kiurdnzq@arch-thunder.localdomain>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Message-ID: <ba571299-8c63-dc07-ddc9-f8d80f93edb1@armadeus.com>
Date:   Wed, 6 Jan 2021 09:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105193248.hegbxct4kiurdnzq@arch-thunder.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8570913041387508766
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdelheelhffgvdevuefggeffhfdvgfekteefhffgveeludeuhfekkeefueekheenucfkpheptddrtddrtddrtddpkeeirddvgeefrddujeeirdegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On 1/5/21 8:32 PM, Rui Miguel Silva wrote:
> Oi Fabio,
> On Tue, Jan 05, 2021 at 01:05:52PM -0300, Fabio Estevam wrote:
>> Hi Rui,
>>
>> On Tue, Jan 5, 2021 at 12:01 PM Rui Miguel Silva <rmfrfs@gmail.com>
>> wrote:
>>
>>> can you see if the following patch make it work again?
>>
>> Yes, with your patch and mine I can capture the same way as with the
>> 5.4 kernel :-)
> 
> Great that it worked.
> 
>>
>> The pink color issue is still present but it is orthogonal to this
>> problem.
>>
>> Could you please submit your patch formally to the list? Please
>> include my attached patch as 1/2 and yours as 2/2.
> 
> yes, I will create a series with the correct fix tags also.
> 
>>
>> Also, please add the following tag to your patch:
>>
>> Tested-by: Fabio Estevam <festevam@gmail.com>

Please add my tag too:

Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Thanks!

Regards,


> 
> will do, thanks and sorry about your issue, I really thought that all
> imx, including imx5,6 and 7 had a mux. I need to get my hand in a
> imx6ull full documentation.
> 
> ------
> Cheers,
>      Rui
> 


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

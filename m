Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58004686A35
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 16:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjBAP0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 10:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjBAP0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 10:26:11 -0500
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Feb 2023 07:26:08 PST
Received: from mout.web.de (mout.web.de [212.227.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7820FFE
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1675265164; bh=JbvNotdOU7p6oSSY/wjXE38FTHKgLlyjD2VKbeih6FI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=nAK/dLmGeiaDsSNW0K5oIHfcrrjOjYkoJ4LKLGxjURcC47HnzklSfN2CWcUWzEU9R
         aL4tsjNtFLN3vKNuH5TkfvQ0ivIyYuj+bKNLvShHl5jTV4LkxFbxE1xgJh7l+L4gUR
         DXmpFliACW3yFAde2U8BjBUY8fyYWvrI3JNuM0bU8X/rLU9qKdkxeBm8ngz8cpVnrV
         ugVVjafhEGVw3QqiI/LPW4JJ87mvIvkuvNlAoMKenjnrQPcGgTvqGZfXi39Ee2Z8D/
         HXyL3dFYEcs/mujXdBpihRwFMapMQlQb6yMj2VFlf33tYUkh4uvlMeOU097v9y1eMr
         fYVQp9yN15nbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.40] ([89.12.34.136]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2BHw-1odZMF1mkI-013U3W; Wed, 01
 Feb 2023 16:20:57 +0100
Message-ID: <e7ee8b9f-eb4b-de7a-7cf8-fb385b2cdec2@web.de>
Date:   Wed, 1 Feb 2023 16:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Future of the SAA7146 drivers
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
Content-Language: en-US
From:   Soeren Moch <smoch@web.de>
In-Reply-To: <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0da9N2hlGbayA9PPPnGyZa+pTupvId229nf1HfWVp8I16bec6YJ
 54IuzjQBwOECrc7Qhm3M4qxUt3KdPlFoqm5liEQqLz4/is0ixMw7Ft/12uCwghWw0s27KMO
 OI9h+oRJo0vnms5WZkOjFCdkD0GSXekqDq3XXM284a92KOySzVQTYzfLEgNukzHhBsl7xd2
 iHD8pN0H65qGJbVfUNxtg==
UI-OutboundReport: notjunk:1;M01:P0:WTC3Q4M1GqA=;4cDFRvoItINWSAY0vtFADZyAzEj
 1k/vgxFsfSEVmx42kKOfk4SJkBcQdH5SDjbtl7DD7WHzWhFYOvisIszh60hpfZ528AYpowABH
 N70Mse9oXfuZiUuZWcSm4JgjEkuKZLcqbg1E5piN5lwOuynfEfRbIG+ON5h4abwQ/w/WKFE/T
 0gFSuQ+mNBwG65KzeozuWBGT3WWrepkhIEJbKxkvdKc3ixsWZNoQeq5rtPKXCIOaJetltIjeV
 4gc0X/eztZXLm4EW/DxADIXbO50A9cnNQZLmjmCh44pQCDHzawnV4yH+0xHVRlQ349uMNMFXM
 XKAoWG/Up5XGDfKw5ZPRHDMTckoCkdP+plfkMj+BTVhxSzO/aKhhfGReA6/u0DeyseDtqU8DX
 cEG9K6eqzkbmSsMRgKuDbMmIHfnWhafE5EtQEc2pR2id7E00rPdxdmITr6RlySMjl3BsorsL5
 ezE+MPJPjERGLlJO2ZXUZN1WlOSgASR7n1LgKOWVNHwVD2ir7LVMsVsh+EfCkjXFlVinJ/Axy
 yppm/epzP6vTZvzEeLVrQofP8CpowIQwq+q/sN9yLBvZ5+kmir7z/kUyWs4rinxWn4DPxyHvI
 PvDgeSDk2C9s/KtW3OTJsV1eEjKB4cOqW3LhDCuXXnENrP15Skvm/Jsam5t06c5vPZ0aD7tM3
 /T/wreuFI3SCJeRLv4MmQ8zHwjx490/3klhFRd181NIKPgPs09C1/qeKaszzFnpCmb2zFM3wS
 bg1MtMUSat3OqUWbRkmpEKvPwEy8UO/6uJdX7u431A27rWB1pB187OCZ+uJIrtijP3kRdYYu6
 eGrfNANG7lHYQGgEjpEwpGDlys9BzUJ7qmcQzi59RoE9NYSFPKTC0VzQmrIK0VSJ64tRonDJq
 cr9Zv+PRCPgEFaw5sR1CQsoVCUETElQz6elYQ+ZB0Bagl3Auk0WoriY1XpS6sjsWYWunhUaTC
 jOEF5Q==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 01.02.23 14:51, Hans Verkuil wrote:
> Hi S=C3=B6ren,
>
> On 01/02/2023 12:35, Soeren Moch wrote:
>
> <snip>
>
>>>>> Obviously, if someone wants to do the vb2 conversion, then that woul=
d be
>>>>> perfect. I was looking at removing analog video support, and that do=
esn't
>>>>> look as easy as I thought it would be.
>>>>>
>> I only own full-featured (Nexus) cards, modified to also support a mode
>> of operation like budget cards. In full-featured cards there is a
>> possibility to re-read the decoded video output signal back, which coul=
d
>> be similar to how analog cards work. But I never had access to
>> analog/hybrid saa7146 cards, so I'm not sure I can test this mode. I
>> also don't know anybody with such card who could help testing.
>> I personally do not care much about analog card support in the driver,
>> but will at least check which part of analog functionality is used in
>> full-featured cards. Maybe the support for analog/hybrid cards and some
>> test coverage comes for free with full support for full-featured cards.
> It's the analog video streaming that uses vb2, so being able to test tha=
t
> is critical.
>
> So I decided to do this differently:
>
> 1) I'll revert the move of saa7146 to staging, it will go back to
>     mainline. av7110 stays in staging for now (that might change, I
>     just don't want to make more changes than strictly necessary).
Hm, you wrote earlier, all this staging is about vb2 conversion.
There is no videobuf in av7110. Why this part needs to stay in staging?

How can I help here?
>
> 2) I will do the vb2 conversion. I have the analog video hardware,
>     so I can test this.
Great! Thanks for this!

Regards,
Soeren
>
> I didn't want to spend time on that originally, but since these drivers
> are still in use, it is probably best if I bite the bullet and just do i=
t.
>
> I'm now almost done with the vb2 conversion of cx18, and it was about
> 2 days work, which isn't that bad. I'll try to get this saa7146 vb2
> conversion done this month.
>
> The PR reverting this has just been posted:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/5902a4f2-da31-81=
6c-f3cf-020340dbaddf@xs4all.nl/
>
> Regards,
>
> 	Hans


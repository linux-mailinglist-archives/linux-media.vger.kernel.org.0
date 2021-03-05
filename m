Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1858532ED90
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 16:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhCEO7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 09:59:41 -0500
Received: from out1-45.antispamcloud.com ([185.201.16.45]:32920 "EHLO
        out1-45.antispamcloud.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhCEO7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 09:59:16 -0500
X-Greylist: delayed 159646 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 09:59:16 EST
Received: from s114.servername.online ([204.44.192.29])
        by mx134.antispamcloud.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gwarnusz@lectorprep.org>)
        id 1lIBv3-000QCi-0r; Fri, 05 Mar 2021 15:59:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lectorprep.org; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=V/Tm/dsXdm+pJIRE7s3Xuu3djvV0ReuifDtlvCc/P3c=; b=4x+6cqqi2l+ZgGlhBSF21Kf9Y+
        Zd/8ONYdkIBlViz6wILdcFz4leLjP24yo+ZVCExTj9xowYC8wyBj41TzJq4g/BoiHeQkn5nSCDTYn
        3EVJZrxL+yhHvzLv/52AYuoSFSZiqWf3G4x8OKcFTbxiiPdz1DHMnl7E487rT/fNnLHL1vCS2AvE9
        m/N2WW76QKNgtX2NLBFqzdIUS1CIhKVMVfyq5FTuCo3WWJ5MG/iuyYPkhxUYewE1syUkb9aWM6v8g
        IwKLqd6BkuKa5CSh0Wt5PxZHscJ6HM6/6CyetxrEtYgzULJq/F4o7cBTyq6XgslF3nto3yiyD1wCe
        8nuCGdwg==;
Received: from localhost ([127.0.0.1]:47800 helo=s114.servername.online)
        by s114.servername.online with esmtpa (Exim 4.93)
        (envelope-from <gwarnusz@lectorprep.org>)
        id 1lIBuJ-00ADvV-FY; Fri, 05 Mar 2021 06:58:24 -0800
MIME-Version: 1.0
Date:   Fri, 05 Mar 2021 08:58:23 -0600
From:   Greg Warnusz <gwarnusz@lectorprep.org>
To:     kieran.bingham@ideasonboard.com
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Subject: Re: Support for the Logitech Brio webcam?
In-Reply-To: <a94af6bd-c3f1-010a-6efe-6ebec53d9396@ideasonboard.com>
References: <2d32b42777e171ebcc77a74c9a09caba@lectorprep.org>
 <0db861b4ea8c69239ac0fd7955891ebe@lectorprep.org>
 <5b9de81ffc46b0faf4d9f9350efa4ecc1113cb82.camel@ndufresne.ca>
 <a94af6bd-c3f1-010a-6efe-6ebec53d9396@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <6cd936c3207d4b8b065df7cef3b12a92@lectorprep.org>
X-Sender: gwarnusz@lectorprep.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
X-Get-Message-Sender-Via: s114.servername.online: authenticated_id: gwarnusz@lectorprep.org
X-Authenticated-Sender: s114.servername.online: gwarnusz@lectorprep.org
X-AuthUser: gwarnusz@lectorprep.org
X-Originating-IP: 204.44.192.29
X-Spampanel-Domain: outgoing-shared.hostpapa.com
X-Spampanel-Username: outgoingshared
Authentication-Results: antispamcloud.com; auth=pass (login) smtp.auth=outgoingshared@outgoing-shared.hostpapa.com
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9WLQux0N3HQm8ltz8rnu+BPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xHvG5uviiElotgbQRbWA5YD+u3ShnFjWJ3V67vt20JPXZf
 WJ5gIMsWU0VuN+yzylKZW2t2lYZOZ/1/6eaGe8W6V3/0jJWivDjGx1n6yvtmCZe4TRmuMSoboqnC
 Vv2ZnsXnx8yeplRO3sLIqUlSH7OGDT8viBD85TIYeFMbliDJ9eWhbk7ycqL5oSDMK9hwZw05uqZy
 DE9pQBacti5APHRLylcctY8DQgP1RCHBeHOXb5z1ds0iMuhI5tg2nDrSS1Nva7vHAWQLm9nFqQvy
 sTUCJOVSe2EmaaFkaNEKpuh71V7fXxo3xLgTTu9r+7o0akxOlZjaOAvmDNNlUzyP2aay8rIxUT/s
 cB2VTeLssVW1qlWB/54y5l/EEgWFtzrfERreFjtVp/zes5jya5gldXAixbpWaRQ4JHvkUTMaHrw4
 L/SsWN8/s8adWggYJCidaZ9AvWR6S+8Nz/JhsIILyn0JRaKhI9PH/KI4koWcgiyjzAW+f0pWY6/m
 V2EXglzX0wFGJ8qPqEQfDQg32UpTmNrXlxjpf3yPqXXNoLQA0rD5gUVBVFOfybSyihFLuHrF0SAp
 OMQJvQ/Ck3iiU+4DQAj3fpzRIzzgHHNpkiopd/EYQq7RhUq22pbavYt0z4M4lPu2udLZLogRYhBC
 Nt/IKByH0wpKyfQ6DB2LAwyk9lHrHu1GPzWDaAJ35pegcF+wx2TO3SUNidnIVzCHk9fO3hfk8zMg
 8uNnjWLM63g5hFeMymCzUKIoYhEG3spI+2D3VuEK/4HWAwO+mBTDCWD/68WjTmLAIkIW6wXrzpi1
 kpKXnTQbOkmZBNsmq1yt1Pkf2Rm76UIkhcR261kWzWcPZIco/oCu154x0v0o7prEtD6Yreswf8jA
 c+wvrAjFiQ0eTSJcjfoh2lYlZNk1LMlkPHfbd9uswVwkUZDzWTnmYZfNyCkxKnhipjS+4lnEGojR
 U1x04a8ci5KPejf+ycx9HFCXYAEfesKl4gY8pPa/kar0q2SdEOMftBjsWb6BDQzjSsHVN0GmGphz
 s9bpXefqEDQrWC8nJ+iI5UG+o7bu2eGG9Td4P5nP1Ku6/6DS66QkABrJDteus1I6gIQ+Ke7Ir9sX
X-Report-Abuse-To: spam@quarantine10.antispamcloud.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you, Kieran.

I was trying to decide whether to buy the Brio. Nicolas Dufresne enabled 
me to understand that the Brio is a UVC camera, so I'm more likely to 
buy it. But I won't be surprised if the select-field-of-view option does 
not work out-of-the-box. Maybe I will be pleasantly surprised.

Greg Warnusz
Saint Louis, Missouri, USA

---
______________________________________

“When I see an adult on a bicycle, I do not despair for the future of 
the human race.”
― H.G. Wells

On 2021-03-05 06:11, Kieran Bingham wrote:
> On 05/03/2021 02:57, Nicolas Dufresne wrote:
>> Le mercredi 03 mars 2021 à 15:26 -0600, Greg Warnusz a écrit :
>>> Dear open-sorcerers,
>>> 
>>> I run Ubuntu and would like to use the Logitech Brio. Most attractive 
>>> is
>>> its selectable 3 fields-of-view.
>>> 
>>> Here's the manufacturer's own blurb about its other abilities:
>>> 
>>> Brio is a remarkable piece of technology that streams crystal-clear
>>> video with superb resolution, frame rate, color and detail, including
>>> autofocus and 5x HD zoom. Brio delivers 4K Ultra HD video at 30 fps, 
>>> HD
>>> 1080p at either 30 or 60 fps, and HD 720p at 30, 60 or an 
>>> ultra-smooth
>>> 90 fps for outstanding clarity, smoothness, and detail.
>>> 
>>> More info:
>>> https://www.logitech.com/en-us/products/webcams/brio-4k-hdr-webcam.960-001105.html?crid=34
>>> 
>>> At US$200, it's still popular, as evidenced by its sold-out status at
>>> many vendors.
>>> 
>>> Is there a chance that developers smarter than I can make this work,
>>> even with limited features, for Linux?
>> 
>> Not ure I understand, the Brio is a UVC camera. In fact, the one I've 
>> used works
>> out of the box. Of course, it works better over USB3.
> 
> I know there are a couple of models of the Brio 4k.
> 
> The one I have works fine too.
> 
> What issues are you actually reporting here? That it doesn't work at
> all? or that you can't select the field of view/zoom?

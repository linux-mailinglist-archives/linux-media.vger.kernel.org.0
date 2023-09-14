Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5DC67A00E8
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 11:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbjINJxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 05:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237963AbjINJxZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 05:53:25 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DB01BFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 02:53:17 -0700 (PDT)
Received: from [192.168.50.82] (91-145-76-168.bb.dnainternet.fi [91.145.76.168])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: vami)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RmXgv5t2Jz49Q2P
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 12:53:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1694685195; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=jZ93upewPGJi/GrhJf94aJI6l6VlsxNC0nQTsKTPwBc=;
        b=c060xTUf6KqVn4MsqHVGHDTuloSQgxfIsRTLic5di5DKm2Vd55rX1H2I9uPD6r+XLAxyrE
        PJhWoIpnoEEWsplk+ah/E9wyxt3dQx90xu/VTEeSAVWnUAndtuEWypiil1tWlcAGfBMQxV
        0GVsSwcNh0a2WA6taQ/60y4MLQDHeI/McGwXGC0u2GGT14FOx5h6N8ASCqVT1EuWLgtLWV
        QY0sAYTxk6wRBcuAChqLp8Ot4YOceqqeitYwuRKdtGe5RqNFHFftW5SVUOWBVpy5v3644Y
        vqFTN0IoRu1r/xxfsKPCQgJW6jEEycnRgYdl9Yr8mxAdNNEL6TGO+0p13s88ng==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1694685195; a=rsa-sha256;
        cv=none;
        b=Zp3puwOe/v1Zb4+CnnOAdo0nPVpY4A93Ej4Y0M8v+PA6ZoJkS7gkcBefyLQYpZhkS+z+eG
        TuF6JNH0JT5PoOncxAYNuPjLg2/+POTLQXBaQAros7NhmYG8uWg/IUBRViTwPsEic1wRn7
        1mVo0kj1IRoe1GQ0PZFSgW1fLqDqFXe1JfdCVGWKxkV+LGssgMahpM71R6FF0S9er89oeU
        YSE4ZXDtGW8iJ7hV4pur8ATlbzpQjDbtWPFhLnxM4RAVFc5F4uR+n3HQwRGnktC0ZunHSL
        XmybaxX32vI2J6BifIgQOeuNQzFOBBbnkIQcfpipFzIZCyeHQcIcuuTwfMn4hg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=vami smtp.mailfrom=mika.vahlberg@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1694685195;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=jZ93upewPGJi/GrhJf94aJI6l6VlsxNC0nQTsKTPwBc=;
        b=afJcZoyDu1SH0j7HFur8Ks1zx8fYlb6737WOC7ejUp5Mx3Mr2IHRypeKip0l8Zxh3siSzG
        Qmz/yiGwMc8bdCdde7xVSJkYarJYhZdmP2ye7RGqL1XsGRDxk2NLKyd+aosYRfb7NTubwV
        FCKe2V96ToyRKUMlnsD+V7Xh05pfmLHox+pd5pKHIlboq3ZEgUnSFDoJ/xnLfRNY1fc9Hm
        tQHY8EwJsf4VNwAXb7czdgFAFwC+GIrY4WN9EH1p9+SAKK8dffzZa144bKerL/zDZddaxm
        9gwUi8UafYeSjgHhKl6v5HMPf9uIFMdpejMm3YKdIHtd4Mtu84hQUSBIM6nT9Q==
Message-ID: <26d1c4fd-b4a3-42e4-8430-e773505d723e@iki.fi>
Date:   Thu, 14 Sep 2023 12:53:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: mika.vahlberg@iki.fi
To:     linux-media@vger.kernel.org
From:   Mika Vahlberg <mika.vahlberg@iki.fi>
Subject: usb 1-2: dvb_usb_anysee: Unsuported Anysee version. Please
 report.....
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Anysee stoped working. No /dev/dvb -folder.


Mika


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF32B24BC5F
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgHTMpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:45:01 -0400
Received: from grey-smtp-cloud7.xs4all.net ([194.109.24.45]:45805 "EHLO
        grey-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727781AbgHTMox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:44:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8jp2kHPY4ywL58jp3kZdL3; Thu, 20 Aug 2020 14:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597927059; bh=FSPyYCeGRW3Vy3ArNo/dzzxOQ7ct5YkaaFV9/3f0qAE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NLZ8veahz/Ayh0dNxdMDxOAUb66z6av2LTriNeBG5Y/YlVEH4NYwlcZOXjft+23kr
         DN8JsgRc+Y2ESzXov98DpWxFFOdDLjLkTVdmPUC707BDN7jFOIYxxA8B3ycvi9pW3p
         4YmnF/XTWVhialJBQhYKM91LzDUZRGCOE6GHOrWq1xXAWgkMEHQKg58LOS2sA2SMyC
         86fVGtb9IE8r1U4vGECRcF9NbBNb3KA5h0uycrlyHyTA2Clsg/1/k0UFreO9houi9S
         sFpTeVtQQ5YQsDzp6iGjS97lfubIlr0qN5swydQI8IJFqv31BVOh9UQJlfLZP1pvGa
         ybXc9kOurNCYw==
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fc2b0094-6dab-9023-9bc8-69e00a9f45bd@xs4all.nl>
Date:   Thu, 20 Aug 2020 14:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMtjEmVx2398VgiGKUCJkCbQWJWUVNnhyjXvbTBEO2YrBSiyjbWbjPc9f87L9XLn7xoo+VStd77mCpMowv2qiPAPOuj/+lhf8FSTiC73jCBzyXQx1kqL
 4J77urhiYf5WjJShUxk2h2hlLKqa0EdL4dZKdUC2WDaUn6VjouoOgXJOKY/r0ISgcuoCQPHR/g/5Qeb1pvnHUB6qqw7Ah/22D3NGCtKi4/irXvxI2ZlDj+pV
 kLJ5F9a1D7L1+p6W5jHwQUzQibN/CB8B8wTqX3/PEX53uF74OeTrAoTGptrfR38GTuF9up90BquIXirGvlYec1zKGLQI6UeSLaabXEgdmwCQzZWy/4OFU+08
 D/xw4PdWiEbzoV+lnh3NaTJE+dUpi9WDRU9VA7155TGIR4hyOiNW5pu6ISYrAWfzd5iLmtJUcZOfVx0sCrtiYCKQNCg2SovYsYlZyo1D4d4oXglL+AV2c6F2
 oQVIVN7wwii+S5NIvjHnyDoSRJppoFgQ+RDc5bB0cf9djgR7jNXRf7cPqkwN0qp5yWe7sZfRs9MbHvSJ4ckniHGdMsPF6kMiYF0yuzashKBvih7YSYLrxxN0
 zmT8A0QTQ30SOfeDnS3juOCdcsO/vbU2xefebc3NbQOzsFj7ypKAfDzu2q60FdVXyNUafl2Z+HMfh/zrZipbBXptN2KyWsmmOjl+sPO7b8vImg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 17:55, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Also supports generating plain HTML documentation and manual pages using
> Doxygen.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Gregor Jasny <gjasny@googlemail.com>
> [Gregor: Control symbol visibility]
> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>

<snip>

I could be mistaken, but I didn't see anything in the meson code to handle
GIT_SHA and GIT_COMMIT_CNT, which are needed in v4l2 and cec utilities.

Has that been tested?

Regards,

	Hans

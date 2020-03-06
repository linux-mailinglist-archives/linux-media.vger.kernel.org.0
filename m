Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD6517B811
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 09:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgCFIGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 03:06:49 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56111 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725935AbgCFIGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 03:06:48 -0500
Received: from [IPv6:2001:983:e9a7:1:6001:5f9a:7b94:512]
 ([IPv6:2001:983:e9a7:1:6001:5f9a:7b94:512])
        by smtp-cloud7.xs4all.net with ESMTPA
        id A80Lj1QxHEE3qA80MjBNXU; Fri, 06 Mar 2020 09:06:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583482006; bh=lUZABpUaNP2FOu3n9W6p+5xG8caw8HYcsH53QApSDjI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vW64wToSV/SnUWg3vdeB13Qce9h7JzW2sbLBmfSSoFgoqSh2/lGMT8xzOeMGuBzd3
         sDndXcyyME9o1YMvvvUq+v5lvRoKNWZzJPHN7R+Lirj5kaadBjl8uaj0e3JEYx2s9m
         c8H2ssA5hV4IlV2la0XfGU4Re3V6g+sU6Ld3H8KklJ258BzbQ3EHD1z6BLcbopwUcn
         82Thel9SsONpOfdPbR4OYseWDHFQ51FgS5ZV+0SywLtOVemROQlQZRLnNwFMYhlyLc
         zs+bUq1QowG1p2JbDrzCtjp/niq7YcPK+2NGt9XnwJofqF648EFghrANQsU58/epPE
         tF6lXOF/Od3OQ==
Subject: Re: edid-decode: Add FreeSync block
To:     Harry Mallon <hjmallon@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <CWLP265MB187340F11A2D130AB0AD3AE4F2E20@CWLP265MB1873.GBRP265.PROD.OUTLOOK.COM>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d436e9e6-eff5-3efc-f5f4-d007bdc62557@xs4all.nl>
Date:   Fri, 6 Mar 2020 09:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CWLP265MB187340F11A2D130AB0AD3AE4F2E20@CWLP265MB1873.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF3iRecVyihaJQb/9goAuriFojH39Xv5mVQ0eWcNtXXpv+HT7rQMcFRNy7Jg0qENmJdSJkopjcJVxsZ57OBi0UmF/L2dssLPv69g/xvRB3QQt52+vvOB
 qaspqenqqLEMta9vr04fVh6CbQwySPAB/k9MOG2AnhoOlhpcoJcBruu2NiE6nSjyWXZf8FXIIeAl5Urn4aGBxRaZWa4KUHMnJASquI0SySk4upvu1wfyuLNN
 3XAQt4M64aoj28J6OgG90LSzCWfL5Q8mCrVgzltKWJq0xFO1XCwN/0qdpmihHSNEkIoU8k0zNgjaEuU5X2Xtyw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Harry,

On 05/03/2020 17:25, Harry Mallon wrote:
> Hi,
> 
> I attach a patch which decodes the simple AMD Freesync structure which is present in some of the examples in edid-decode.

Thank you for the patch. But can you provide a 'Signed-off-by' line?

See here: https://elinux.org/Developer_Certificate_Of_Origin

It's enough to just reply with your Sob, no need to post a new patch.

Out of curiosity: is this information freely available somewhere?

Regards,

	Hans

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99207422AE
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 10:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjF2Iwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 04:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjF2IwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 04:52:14 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6483C10D5
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688028723; x=1688633523; i=heinz-kemner@gmx.de;
 bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=tzmcaVrCXZVe/yrBIRXIK50XDwMB+zHAe8/9Yg6Yx+4MAXFWWL/lyc8MLiK04wPj+t72rFd
 23DIx5sscIiW0hlhYQeMSnWc6D6jsWSorEiWocyhYXsEGuYVMHEa6uPREUOJfMiUaj8kWTZgT
 bq0sbMZ616v7lnCjdpDaRtFNhlfK8q45eEEwfSfhrBPAQ0bvRzkqxKYAW4/GQv25oQX2GsqLi
 /kLk738+R7BAJMHWLOl+iq9d96cuV8eE6AdkDzZMHDegCBIV55ISAGrAbPMbzdwxErM+TsM8t
 Y0KXcZc/QHafT8XyQlj4zHyVSwgKdbqRuUtexD06vjZkqM8jT4Nw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.101] ([91.52.25.55]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1qaDjh2frC-00WVUT for
 <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 10:52:03 +0200
Message-ID: <2ad0efa8-25ad-9754-fd65-01b394fd1b66@gmx.de>
Date:   Thu, 29 Jun 2023 10:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To:     linux-media@vger.kernel.org
Content-Language: de-DE
From:   Heinz Kemner <Heinz-Kemner@gmx.de>
Subject: ID 046d:08e5 not listed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lOPIdpS0PkTsIasgDmh4BUnEt9Lq1vsUXe7gNl9PWCCUaxUSmFC
 QslrvHhBLo6fpVhaTfb6vbDidvJvn+iY26pbF91HOsaY/TKfyqg3s6mO2N6vkeVcS4mguBH
 GKpvMQJHL3IsUYQqjuYSgk9KN/C7PaacKr2+6SPjNiFP3BdEUsvbwFGeMszRjLD0n6PlyV1
 nuwAf16Y8mSYyhVQ+LLaQ==
UI-OutboundReport: notjunk:1;M01:P0:qX0hIBkVcq8=;+/6Azuyz5MGmzLf89WDbscOUGx/
 FQCq2RLmGeylhxRF0/WdsHGbS2EXFsUNPbPE5h96PaQ5v064D5b9EwIWLDQBs4dqfEai7+rrv
 XUbfO5Bi+k5gKI9TK8oaPISgdGJ7L4/l23zxtxjYSxUasT6OcCD2DGBgtZFlm4dYcgt1bTnQB
 XSiBd6Duf1ldeKQ6cSgm9cTDOiR70qOhzVrPWZ605TrLgtlvCMoARAKqcaW756CF10xcJ82Nf
 EDm5DAH6eGkRVmBqAOCRMuw4CAzTl2WBncvvEUholGi4EMzCTvNZAsPkLyQwK+wYEkYtgHQWs
 KiXz6I2tdFkVloR8lQyBXK6YniC2xYdkJe/7hf+zpyS3oo0P2mliOTm/c2nkK6l/7LTqSuTin
 rl7VDqShYQj9m5Sk+LG6km+iWF/jungUdjTx2e7k41XK5Fzld8/J6C+dn6kwuAcWEde89S2bi
 2NDAEPaa75UJiyBa3pwAaBEVcBbBJz7HpiNgHAJnuknq/RR7Zml8KQgG/58iToDEf/hZRwZFt
 YVT7FBuBnKwoyGpG4M+V+ku/rPEEmNTK0j8ZtV+GzBOnrVcWUENgfgkYZDYj3oQihn5I6amiz
 TncEVfXNOOFbaZGrcyGx5euyDyduhSxrW3bfSAeczIyybwgxG5EqabrbC/UyOWv/73eejwGTV
 YG0CTkcp7B8SJkENK6blSWVQpY1rPVhoX7LoVepxitQN+N+vXkf6EN4aZeTw5OwPhnG93Jfmk
 IAyDz5bYZ/pQHLsYmRi9mHpM8RnFs3kZooKEv3U5oAXPyR9hoZi3pvaDZg4dYYuzXTx3Logdf
 RjzdoMwR/CdqF7x2MCxytbiPTQdk9aHlnzx3INBjIEZiIdBWfiFu7VY6yfmK1Rpxl467MtlHq
 eQL6MwyHRy0w/PL8Wp0FuC7LV1oPOnCjn8gKhHfhzXwXvETCc2UiRdg5Bj0jRJGHD2jhDv1+0
 ONfJ2g==
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,FREEMAIL_FROM,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


